"""
Two-Skill Toy Model: Comparative Advantage Counter-Analysis
Shows that reallocation (comparative advantage argument) only helps temporarily
and the window narrows as AI capability K increases.
"""
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
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
# MODEL PARAMETERS
# ============================================================
alpha = 0.05   # learning rate
beta = 0.05    # decay rate
epsilon = 0.01 # floor for learning
gamma = 0.5    # delegation sensitivity (unused in ODE directly, kept for consistency)
delta = 0.05   # social contagion

T_MAX = 200
H1_0 = 0.7
H2_0 = 0.7

def two_skill_ode(t, y, alpha, beta, epsilon, p1, p2):
    """
    dH1/dt = alpha*(H1+epsilon)*(1-H1)*p1 - beta*H1*(1-p1)
    dH2/dt = alpha*(H2+epsilon)*(1-H2)*p2 - beta*H2*(1-p2)
    p1, p2 are practice time fractions; (1-p1), (1-p2) are delegation rates.
    """
    H1, H2 = y
    dH1 = alpha * (H1 + epsilon) * (1 - H1) * p1 - beta * H1 * (1 - p1)
    dH2 = alpha * (H2 + epsilon) * (1 - H2) * p2 - beta * H2 * (1 - p2)
    return [dH1, dH2]


def simulate_scenario(D1, D2, label):
    """
    D1, D2 = delegation rates for skill 1 and 2.
    Practice time: p1 = 1 - D1, p2 = 1 - D2.
    """
    p1 = 1.0 - D1
    p2 = 1.0 - D2
    t_span = (0, T_MAX)
    t_eval = np.linspace(0, T_MAX, 1000)
    sol = solve_ivp(two_skill_ode, t_span, [H1_0, H2_0],
                    args=(alpha, beta, epsilon, p1, p2),
                    t_eval=t_eval, method='RK45')
    H1 = sol.y[0]
    H2 = sol.y[1]
    H_total = (H1 + H2) / 2.0
    return sol.t, H1, H2, H_total


# ============================================================
# PANEL A: Three scenarios at K=0.9
# ============================================================
K = 0.9

# Scenario A: No reallocation — AI takes skill 1, skill 2 unaffected
# D1=0.9 (high delegation of skill 1), D2=0.1 (low delegation of skill 2 — some natural)
t_A, H1_A, H2_A, Ht_A = simulate_scenario(D1=0.9, D2=0.1, label="No reallocation")

# Scenario B: Full reallocation — AI takes skill 1, freed time → skill 2
# D1=0.9, D2=0.0 (all freed time goes to practicing skill 2)
t_B, H1_B, H2_B, Ht_B = simulate_scenario(D1=0.9, D2=0.0, label="Full reallocation")

# Scenario C: Both skills AI-capable — AI handles both
# D1=0.9, D2=0.9
t_C, H1_C, H2_C, Ht_C = simulate_scenario(D1=0.9, D2=0.9, label="Both AI-capable")


# ============================================================
# PANEL B: H_total vs K sweep
# ============================================================
K_values = np.linspace(0.5, 1.0, 20)
Ht_realloc = []
Ht_norealloc = []
Ht_both_ai = []

for K_val in K_values:
    # Map K to delegation rate: D = K (higher capability = more delegation)
    D = K_val

    # No reallocation: D1=K, D2=0.1 (baseline low delegation)
    _, _, _, Ht_nr = simulate_scenario(D1=D, D2=0.1, label="")
    Ht_norealloc.append(Ht_nr[-1])

    # Full reallocation: D1=K, D2=0 (freed time to skill 2)
    _, _, _, Ht_r = simulate_scenario(D1=D, D2=0.0, label="")
    Ht_realloc.append(Ht_r[-1])

    # Both AI-capable: D1=K, D2=K
    _, _, _, Ht_b = simulate_scenario(D1=D, D2=D, label="")
    Ht_both_ai.append(Ht_b[-1])

Ht_norealloc = np.array(Ht_norealloc)
Ht_realloc = np.array(Ht_realloc)
Ht_both_ai = np.array(Ht_both_ai)


# ============================================================
# FIGURE
# ============================================================
fig, axes = plt.subplots(1, 2, figsize=(10, 4))

# --- Panel A: Time series ---
ax = axes[0]

# Scenario A
ax.plot(t_A, Ht_A, color=C_MAIN, linewidth=2, label="A: No reallocation")
ax.plot(t_A, H1_A, color=C_MAIN, linewidth=0.8, linestyle="--", alpha=0.5)
ax.plot(t_A, H2_A, color=C_MAIN, linewidth=0.8, linestyle=":", alpha=0.5)

# Scenario B
ax.plot(t_B, Ht_B, color=C_SAFE, linewidth=2, label="B: Full reallocation")
ax.plot(t_B, H1_B, color=C_SAFE, linewidth=0.8, linestyle="--", alpha=0.5)
ax.plot(t_B, H2_B, color=C_SAFE, linewidth=0.8, linestyle=":", alpha=0.5)

# Scenario C
ax.plot(t_C, Ht_C, color=C_DANGER, linewidth=2, label="C: Both AI-capable")
ax.plot(t_C, H1_C, color=C_DANGER, linewidth=0.8, linestyle="--", alpha=0.5)
ax.plot(t_C, H2_C, color=C_DANGER, linewidth=0.8, linestyle=":", alpha=0.5)

ax.set_xlabel("Time (generations)")
ax.set_ylabel("Skill level")
ax.set_title("A. Three delegation scenarios ($K=0.9$)")
ax.legend(loc="best", frameon=False)
ax.set_ylim(0, 1.05)
ax.set_xlim(0, T_MAX)

# Add thin annotation lines for H1/H2
ax.text(T_MAX * 0.75, H1_A[-1] + 0.02, "$H_1$", fontsize=7, color=C_MAIN, alpha=0.7)
ax.text(T_MAX * 0.75, H2_A[-1] + 0.02, "$H_2$", fontsize=7, color=C_MAIN, alpha=0.7)

# --- Panel B: K sweep ---
ax = axes[1]

ax.plot(K_values, Ht_realloc, color=C_SAFE, linewidth=2, marker='o', markersize=3,
        label="Reallocation (comparative advantage)")
ax.plot(K_values, Ht_norealloc, color=C_MAIN, linewidth=2, marker='s', markersize=3,
        label="No reallocation")
ax.plot(K_values, Ht_both_ai, color=C_DANGER, linewidth=2, marker='^', markersize=3,
        label="Both skills AI-capable")

# Shade the benefit window
benefit = Ht_realloc - Ht_norealloc
mask = benefit > 0.01
if np.any(mask):
    ax.fill_between(K_values[mask], Ht_norealloc[mask], Ht_realloc[mask],
                    alpha=0.15, color=C_SAFE, label="Reallocation benefit")

# Reference line
ax.axhline(y=H1_0, color='gray', linestyle=':', linewidth=0.5, alpha=0.5)
ax.text(0.51, H1_0 + 0.01, "Initial $H$", fontsize=7, color='gray')

ax.set_xlabel("AI capability $K$")
ax.set_ylabel("Equilibrium $\\bar{H}_{total}$")
ax.set_title("B. Reallocation benefit narrows with $K$")
ax.legend(loc="best", frameon=False, fontsize=7)
ax.set_ylim(0, 1.05)
ax.set_xlim(0.48, 1.02)

plt.tight_layout()
fig.savefig("paper_figures/fig_two_skill.png", dpi=300)
fig.savefig("paper_figures/fig_two_skill.pdf")
plt.close()

print("=== Two-Skill Model Results ===")
print(f"Scenario A (no realloc): H_total={Ht_A[-1]:.4f}, H1={H1_A[-1]:.4f}, H2={H2_A[-1]:.4f}")
print(f"Scenario B (full realloc): H_total={Ht_B[-1]:.4f}, H1={H1_B[-1]:.4f}, H2={H2_B[-1]:.4f}")
print(f"Scenario C (both AI): H_total={Ht_C[-1]:.4f}, H1={H1_C[-1]:.4f}, H2={H2_C[-1]:.4f}")
print(f"\nReallocation benefit at K=0.9: {Ht_B[-1] - Ht_A[-1]:+.4f}")
print(f"Both-AI collapse at K=0.9: {Ht_C[-1] - Ht_A[-1]:+.4f}")
print(f"\nK sweep equilibrium (realloc): min={Ht_realloc.min():.4f}, max={Ht_realloc.max():.4f}")
print(f"K sweep equilibrium (no realloc): min={Ht_norealloc.min():.4f}, max={Ht_norealloc.max():.4f}")
print(f"K sweep equilibrium (both AI): min={Ht_both_ai.min():.4f}, max={Ht_both_ai.max():.4f}")
print("\nFigure saved to paper_figures/fig_two_skill.{png,pdf}")
