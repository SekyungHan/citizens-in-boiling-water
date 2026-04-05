"""
PISA Profile Likelihood Analysis
Demonstrates non-identifiability of alpha by profiling over alpha
and optimizing beta for each fixed alpha.
"""
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from scipy.optimize import minimize_scalar
from scipy.integrate import solve_ivp
import os

plt.rcParams.update({
    "font.family": "serif", "font.serif": ["Times New Roman", "DejaVu Serif"],
    "font.size": 9, "axes.titlesize": 11, "axes.labelsize": 10,
    "xtick.labelsize": 8, "ytick.labelsize": 8, "legend.fontsize": 8,
    "figure.dpi": 300, "savefig.dpi": 300, "savefig.bbox": "tight",
    "axes.spines.top": False, "axes.spines.right": False, "axes.linewidth": 0.8,
})

C_MAIN = "#1B7A8A"
C_ACCENT = "#D4984A"
C_DANGER = "#C75C3A"
C_SAFE = "#5A7D6A"
C_DARK = "#2C3E50"

os.makedirs("paper_figures", exist_ok=True)

# ============================================================
# PISA DATA (OECD average math scores)
# ============================================================
pisa_years = np.array([2003, 2006, 2009, 2012, 2015, 2018, 2022])
pisa_scores = np.array([500, 498, 496, 494, 490, 489, 472])

# Normalize scores to [0, 1] for model fitting
# Use 500 as reference (initial max)
pisa_H = pisa_scores / 500.0
pisa_t = pisa_years - pisa_years[0]  # time from 0


def skill_decay_model(t_eval, alpha, beta, H0, epsilon=0.01, K=0.7):
    """
    Simulate skill dynamics under AI delegation.
    dH/dt = alpha*(H+epsilon)*(1-H)*(1-D) - beta*H*D
    where D is delegation probability, modeled as increasing over time
    (proxy for technology adoption).
    D(t) = 1 / (1 + exp(-0.2*(t - 10)))  sigmoid adoption curve
    """
    def ode(t, y):
        H = y[0]
        # Technology adoption sigmoid: starts low, increases
        D = K / (1 + np.exp(-0.15 * (t - 10)))
        dH = alpha * (H + epsilon) * (1 - H) * (1 - D) - beta * H * D
        return [dH]

    sol = solve_ivp(ode, (0, t_eval[-1]), [H0], t_eval=t_eval, method='RK45')
    return sol.y[0]


def compute_sse(alpha_fixed, beta_val):
    """Compute SSE for given alpha and beta."""
    try:
        H_pred = skill_decay_model(pisa_t.astype(float), alpha_fixed, beta_val, pisa_H[0])
        if len(H_pred) != len(pisa_H):
            return 1e10
        return np.sum((H_pred - pisa_H) ** 2)
    except Exception:
        return 1e10


# ============================================================
# PROFILE LIKELIHOOD: Fix alpha, optimize beta
# ============================================================
alpha_values = np.logspace(-4, -1, 20)
optimal_betas = []
r_squared_values = []
sse_values = []

SS_tot = np.sum((pisa_H - np.mean(pisa_H)) ** 2)

for alpha_fix in alpha_values:
    # Optimize beta for this fixed alpha
    result = minimize_scalar(
        lambda b: compute_sse(alpha_fix, b),
        bounds=(0.001, 0.5),
        method='bounded'
    )
    opt_beta = result.x
    opt_sse = result.fun

    optimal_betas.append(opt_beta)
    sse_values.append(opt_sse)

    R2 = 1 - opt_sse / SS_tot if SS_tot > 0 else 0
    r_squared_values.append(R2)

optimal_betas = np.array(optimal_betas)
r_squared_values = np.array(r_squared_values)
sse_values = np.array(sse_values)


# ============================================================
# FIGURE
# ============================================================
fig, axes = plt.subplots(1, 2, figsize=(10, 4))

# --- Panel A: Profile likelihood (R² vs alpha) ---
ax = axes[0]
ax.semilogx(alpha_values, r_squared_values, color=C_MAIN, linewidth=2, marker='o', markersize=4)

# Shade the "flat" region
r2_range = r_squared_values.max() - r_squared_values.min()
ax.axhline(y=r_squared_values.max(), color='gray', linestyle=':', linewidth=0.5, alpha=0.5)

# Annotate flatness
if r2_range < 0.1:
    ax.annotate(f"$\\Delta R^2 = {r2_range:.4f}$\n(effectively flat)",
                xy=(alpha_values[len(alpha_values)//2], r_squared_values.mean()),
                xytext=(alpha_values[2], r_squared_values.min() - 0.05),
                fontsize=8, color=C_DANGER,
                arrowprops=dict(arrowstyle='->', color=C_DANGER, lw=0.8))

ax.set_xlabel("Learning rate $\\alpha$ (log scale)")
ax.set_ylabel("$R^2$ (goodness of fit)")
ax.set_title("A. Profile likelihood: $\\alpha$ non-identifiability")
ax.set_ylim(min(0, r_squared_values.min() - 0.1), 1.05)

# --- Panel B: Optimal beta vs alpha ---
ax = axes[1]
ax.loglog(alpha_values, optimal_betas, color=C_ACCENT, linewidth=2, marker='s', markersize=4)

# Show the compensatory relationship
slope = np.polyfit(np.log10(alpha_values), np.log10(optimal_betas), 1)
ax.set_xlabel("Learning rate $\\alpha$ (log scale)")
ax.set_ylabel("Optimal decay rate $\\beta^*$ (log scale)")
ax.set_title(f"B. Compensatory $\\alpha$-$\\beta$ relationship")

# Add slope annotation
ax.text(0.05, 0.95, f"log-log slope = {slope[0]:.2f}",
        transform=ax.transAxes, fontsize=8, va='top',
        bbox=dict(boxstyle='round,pad=0.3', facecolor='lightyellow', edgecolor='gray', alpha=0.8))

plt.tight_layout()
fig.savefig("paper_figures/fig_pisa_profile.png", dpi=300)
fig.savefig("paper_figures/fig_pisa_profile.pdf")
plt.close()

# ============================================================
# PRINT RESULTS
# ============================================================
print("=== PISA Profile Likelihood Results ===")
print(f"Alpha range: [{alpha_values[0]:.6f}, {alpha_values[-1]:.6f}]")
print(f"R² range: [{r_squared_values.min():.6f}, {r_squared_values.max():.6f}]")
print(f"R² variation (max-min): {r2_range:.6f}")
print(f"Optimal beta range: [{optimal_betas.min():.6f}, {optimal_betas.max():.6f}]")
print(f"Log-log slope (alpha vs beta): {slope[0]:.4f}")
print()
print("Profile table:")
print(f"{'alpha':>12s} {'beta*':>12s} {'R²':>12s} {'SSE':>12s}")
for i in range(len(alpha_values)):
    print(f"{alpha_values[i]:12.6f} {optimal_betas[i]:12.6f} {r_squared_values[i]:12.6f} {sse_values[i]:12.8f}")
print("\nFigure saved to paper_figures/fig_pisa_profile.{png,pdf}")
