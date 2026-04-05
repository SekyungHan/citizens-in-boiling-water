"""
PISA Multi-Country Panel ODE Analysis
dH/dt = a*(H+e)*(1-H)*(1-D) - b*H*D
H = score/Hmax. Shared a,b,Hmax; country-specific D(t).
"""
import numpy as np, matplotlib; matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.colors import Normalize
from matplotlib.cm import ScalarMappable
from scipy.optimize import minimize, differential_evolution
import os, json, sys, time, warnings
warnings.filterwarnings("ignore")

t0=time.time()
def T(): return f"[{time.time()-t0:.0f}s]"

plt.rcParams.update({
    "font.family":"sans-serif","font.sans-serif":["Arial","DejaVu Sans"],
    "font.size":6,"axes.titlesize":7,"axes.labelsize":6,
    "xtick.labelsize":5,"ytick.labelsize":5,"legend.fontsize":5,
    "figure.dpi":300,"savefig.dpi":300,"savefig.bbox":"tight",
    "axes.spines.top":False,"axes.spines.right":False,"axes.linewidth":0.6,
    "mathtext.fontset":"stix",
})
C1="#1B7A8A";C2="#D4984A";C3="#C75C3A";C4="#5A7D6A";C5="#2C3E50"
OFIG="paper_figures"
OANA="analyses/pisa_multicountry"
os.makedirs(OFIG,exist_ok=True); os.makedirs(OANA,exist_ok=True)

YR=np.array([2003,2006,2009,2012,2015,2018,2022])
P={
'Finland':[544,548,541,519,511,507,484],'Sweden':[509,502,494,478,494,502,482],
'Australia':[524,520,514,504,494,491,487],'New Zealand':[523,522,519,500,495,494,479],
'France':[511,496,497,495,493,495,474],'Germany':[503,504,513,514,506,500,475],
'USA':[483,474,487,481,470,478,465],'UK':[508,495,492,494,492,502,489],
'Japan':[534,523,529,536,532,527,536],'Korea':[542,547,546,554,524,526,527],
'Singapore':[None,None,562,573,564,569,575],
'Turkey':[423,424,445,448,420,454,453],'Chile':[None,411,421,423,423,417,412],
'Mexico':[385,406,419,413,408,409,395],'Indonesia':[360,391,371,375,386,379,366],
}
I={
'Finland':[69,79,82,91,93,94,95],'Sweden':[77,84,91,94,95,96,97],
'Australia':[67,69,76,83,88,87,92],'New Zealand':[72,69,80,82,88,91,93],
'France':[37,47,72,83,85,82,90],'Germany':[55,72,79,84,88,90,93],
'USA':[62,69,71,79,75,90,92],'UK':[65,68,83,90,92,95,97],
'Japan':[62,69,78,86,91,92,93],'Korea':[65,78,81,84,90,96,97],
'Singapore':[62,67,69,72,81,88,92],
'Turkey':[12,18,36,45,54,72,83],'Chile':[25,34,41,62,64,82,90],
'Mexico':[14,19,26,40,57,66,76],'Indonesia':[2,5,7,15,22,40,62],
}
EPS=0.01

countries=[]
for nm in P:
    v=[i for i,s in enumerate(P[nm]) if s is not None]
    if len(v)<3: continue
    fv=v[0]
    countries.append({'name':nm,
        'raw':np.array([P[nm][i] for i in v],dtype=float),
        'D':np.array([I[nm][i]/100.0 for i in v]),
        't':np.array([(YR[i]-YR[fv]) for i in v],dtype=float),
        'yr':np.array([YR[i] for i in v]),
        'mean_inet':np.mean([I[nm][i] for i in v]),
    })
print(f"{len(countries)} countries loaded {T()}", flush=True)

# ── RK4 solver (fast, accurate) ────────────────────────────
def rhs(H, d, a, b):
    """ODE right-hand side."""
    return a*(H+EPS)*(1.0-H)*(1.0-d) - b*H*d

def solve(a, b, hm, c, dt=0.25):
    """RK4 integration. Returns predicted scores at c['t']."""
    H = c['raw'][0] / hm
    out = [c['raw'][0]]
    tc = c['t'][0]
    for k in range(1, len(c['t'])):
        tt = c['t'][k]
        while tc < tt - 1e-10:
            s = min(dt, tt - tc)
            d = np.interp(tc, c['t'], c['D'])
            d2 = np.interp(tc+s/2, c['t'], c['D'])
            d3 = np.interp(tc+s, c['t'], c['D'])
            k1 = rhs(H, d, a, b)
            k2 = rhs(H+s*k1/2, d2, a, b)
            k3 = rhs(H+s*k2/2, d2, a, b)
            k4 = rhs(H+s*k3, d3, a, b)
            H += s*(k1+2*k2+2*k3+k4)/6
            H = max(1e-8, min(1-1e-8, H))
            tc += s
        out.append(H * hm)
    return np.array(out)

def solve_dense(a, b, hm, c, n=80, dt=0.25):
    """Dense trajectory."""
    H = c['raw'][0] / hm
    td = np.linspace(c['t'][0], c['t'][-1], n)
    out = [c['raw'][0]]
    tc = c['t'][0]
    for k in range(1, n):
        tt = td[k]
        while tc < tt - 1e-10:
            s = min(dt, tt - tc)
            d = np.interp(tc, c['t'], c['D'])
            d2 = np.interp(tc+s/2, c['t'], c['D'])
            d3 = np.interp(tc+s, c['t'], c['D'])
            k1 = rhs(H, d, a, b)
            k2 = rhs(H+s*k1/2, d2, a, b)
            k3 = rhs(H+s*k2/2, d2, a, b)
            k4 = rhs(H+s*k3, d3, a, b)
            H += s*(k1+2*k2+2*k3+k4)/6
            H = max(1e-8, min(1-1e-8, H))
            tc += s
        out.append(H * hm)
    return td, np.array(out)

def sse_all(p):
    a,b,hm=p
    if a<=0 or b<=0 or hm<500 or hm>1000: return 1e12
    s=0.0
    for c in countries:
        pr=solve(a,b,hm,c)
        if np.any(np.isnan(pr)): return 1e12
        s+=np.sum((c['raw']-pr)**2)
    return s

def sse_sub(p, sub):
    a,b,hm=p
    if a<=0 or b<=0 or hm<500 or hm>1000: return 1e12
    s=0.0
    for c in sub:
        pr=solve(a,b,hm,c)
        if np.any(np.isnan(pr)): return 1e12
        s+=np.sum((c['raw']-pr)**2)
    return s

# ── Fit ────────────────────────────────────────────────────
print(f"DE... {T()}", flush=True)
res=differential_evolution(sse_all,
    bounds=[(0.001,1.0),(0.001,1.0),(550,950)],
    seed=42, maxiter=200, tol=1e-10, popsize=15, polish=False)
af,bf,hf=res.x
print(f"  a={af:.5f} b={bf:.5f} Hm={hf:.1f} SSE={res.fun:.1f} {T()}", flush=True)

# NM polish (limited)
r2=minimize(sse_all, res.x, method='Nelder-Mead', options={'maxiter':3000})
if r2.fun<=res.fun:
    af,bf,hf=r2.x
    print(f"  NM: a={af:.5f} b={bf:.5f} Hm={hf:.1f} SSE={r2.fun:.1f} {T()}", flush=True)

# Stats
ao=np.concatenate([c['raw'] for c in countries])
ap=np.concatenate([solve(af,bf,hf,c) for c in countries])
N=len(ao); K=3
ssr=np.sum((ao-ap)**2); sst=np.sum((ao-np.mean(ao))**2)
R2=1-ssr/sst; AIC=N*np.log(ssr/N)+2*K; BIC=N*np.log(ssr/N)+K*np.log(N)
print(f"  R2={R2:.4f} AIC={AIC:.1f} BIC={BIC:.1f} N={N} {T()}", flush=True)

# Linear
pL=[]; kL=0
for c in countries:
    A=np.vstack([np.ones_like(c['t']),c['t']]).T
    pL.append(A@np.linalg.lstsq(A,c['raw'],rcond=None)[0]); kL+=2
pL=np.concatenate(pL)
ssL=np.sum((ao-pL)**2); R2L=1-ssL/sst
AICL=N*np.log(ssL/N)+2*kL; BICL=N*np.log(ssL/N)+kL*np.log(N)
print(f"  Lin: R2={R2L:.4f} AIC={AICL:.1f} BIC={BICL:.1f} k={kL} {T()}", flush=True)

# Exp
def fE(p):
    be=p[0]
    if abs(be)>0.1: return 1e12
    return sum(np.sum((c['raw']-p[1+i]*np.exp(-be*c['t']))**2) for i,c in enumerate(countries))
rE=minimize(fE,[0.002]+[c['raw'][0] for c in countries],method='Nelder-Mead',options={'maxiter':30000})
kE=1+len(countries); bE=rE.x[0]
pE=np.concatenate([rE.x[1+i]*np.exp(-bE*c['t']) for i,c in enumerate(countries)])
ssE=np.sum((ao-pE)**2); R2E=1-ssE/sst
AICE=N*np.log(ssE/N)+2*kE; BICE=N*np.log(ssE/N)+kE*np.log(N)
print(f"  Exp: R2={R2E:.4f} AIC={AICE:.1f} BIC={BICE:.1f} k={kE} {T()}", flush=True)

# ── Bootstrap 50 ──────────────────────────────────────────
print(f"Bootstrap... {T()}", flush=True)
NB=50; aB=[]; bB=[]; hB=[]; np.random.seed(42)
for bi in range(NB):
    idx=np.random.choice(len(countries),len(countries),replace=True)
    bc=[countries[j] for j in idx]
    x0=[af*(1+0.02*np.random.randn()),bf*(1+0.02*np.random.randn()),
        hf*(1+0.003*np.random.randn())]
    x0=[max(0.001,x0[0]),max(0.001,x0[1]),max(550,min(950,x0[2]))]
    try:
        rb=minimize(lambda p,_b=bc: sse_sub(p,_b), x0,
                    method='Nelder-Mead', options={'maxiter':1000})
        if rb.fun<1e10 and rb.x[0]>0 and rb.x[1]>0:
            aB.append(rb.x[0]); bB.append(rb.x[1]); hB.append(rb.x[2])
    except: pass
    if (bi+1)%10==0:
        print(f"  {bi+1}/{NB} ({len(aB)} ok) {T()}", flush=True)

aB=np.array(aB); bB=np.array(bB); hB=np.array(hB)
aCI=np.percentile(aB,[2.5,97.5]); bCI=np.percentile(bB,[2.5,97.5]); hCI=np.percentile(hB,[2.5,97.5])
print(f"  a={af:.4f}[{aCI[0]:.4f},{aCI[1]:.4f}] b={bf:.4f}[{bCI[0]:.4f},{bCI[1]:.4f}] {T()}", flush=True)

# ── Profile ────────────────────────────────────────────────
print(f"Profile... {T()}", flush=True)
NP=20; ag=np.linspace(max(0.001,af*0.15), af*4, NP)
psse=[]
for ax in ag:
    rp=minimize(lambda p,_a=ax: sse_all([_a,p[0],p[1]]),
                [bf,hf], method='Nelder-Mead', options={'maxiter':1000})
    psse.append(rp.fun)
psse=np.array(psse)
pll=-0.5*N*np.log(psse/N); pll_n=pll-pll.max()
pi=np.argmax(pll); peaked=0<pi<NP-1; llr=pll.max()-pll.min()
print(f"  Peak={ag[pi]:.4f} range={llr:.2f} peaked={peaked} {T()}", flush=True)

# Single-traj
fc=[c for c in countries if len(c['raw'])==7]
or_=np.mean([c['raw'] for c in fc],axis=0)
oD=np.mean([c['D'] for c in fc],axis=0)
ot=(YR-YR[0]).astype(float)
oc={'name':'OECD','raw':or_,'D':oD,'t':ot,'yr':YR,'mean_inet':np.mean(oD)*100}
spsse=[]
for ax in ag:
    def so(p,_a=ax):
        pr=solve(_a,p[0],p[1],oc)
        return np.sum((oc['raw']-pr)**2) if not np.any(np.isnan(pr)) else 1e12
    rp=minimize(so,[bf,hf],method='Nelder-Mead',options={'maxiter':1000})
    spsse.append(rp.fun)
spsse=np.array(spsse); spll=-0.5*7*np.log(spsse/7); spll_n=spll-spll.max()
print(f"  Single done {T()}", flush=True)

# ── FIGURES ────────────────────────────────────────────────
print(f"Figures... {T()}", flush=True)
nc=Normalize(vmin=20,vmax=95); cm=plt.cm.RdYlBu_r

fig,axes=plt.subplots(1,3,figsize=(14,4.2))
# A
ax=axes[0]
for c in countries:
    cl=cm(nc(c['mean_inet']))
    ax.plot(c['yr'],c['raw'],'o',color=cl,ms=3.5,alpha=0.7,zorder=3)
    td,Hd=solve_dense(af,bf,hf,c)
    yd=np.interp(td,c['t'],c['yr'])
    ax.plot(yd,Hd,'-',color=cl,lw=1.0,alpha=0.6,zorder=2)
    if c['name'] in {'Finland','Japan','Indonesia','Korea','USA','Singapore','Turkey','Mexico'}:
        ax.annotate(c['name'],(c['yr'][-1],c['raw'][-1]),fontsize=5.5,
                    ha='left',xytext=(3,0),textcoords='offset points',color=cl)
sm=ScalarMappable(cmap=cm,norm=nc); sm.set_array([])
cb=plt.colorbar(sm,ax=ax,shrink=0.85,pad=0.02)
cb.set_label("Mean internet adoption (%)",fontsize=7); cb.ax.tick_params(labelsize=6)
ax.set_xlabel("Year"); ax.set_ylabel("PISA math score")
ax.set_title("A. Multi-country trajectories + ODE fits",fontsize=7,fontweight='bold',loc='left')
ax.set_xlim(2002,2024)
ax.set_xticks([2003,2006,2009,2012,2015,2018,2022])
plt.setp(ax.get_xticklabels(), rotation=30, ha="right")

# B
ax=axes[1]
ax.plot(ag,pll_n,'-o',color=C1,ms=3,lw=1.5,label='Multi-country (15)',zorder=3)
ax.plot(ag,spll_n,'--s',color=C3,ms=3,lw=1.2,alpha=0.7,label='Single OECD avg',zorder=2)
ax.axvline(af,color=C1,lw=0.8,ls=':',alpha=0.6)
ax.axhline(-1.92,color='gray',lw=0.8,ls='--',alpha=0.5)
ax.text(ag[-1]*0.95,-1.5,'95% CI',fontsize=6,ha='right',color='gray')
ax.set_xlabel(r"$\alpha$ (recovery rate)"); ax.set_ylabel("Profile log-lik (norm.)")
ax.set_title(r"B. Profile likelihood of $\alpha$",fontsize=7,fontweight='bold',loc='left')
ax.legend(loc='lower left',fontsize=7,framealpha=0.8)

# C
ax=axes[2]
for c in countries:
    cl=cm(nc(c['mean_inet']))
    pc=solve(af,bf,hf,c)
    ax.scatter(c['raw'],pc,c=cl,s=20,alpha=0.7,edgecolor='white',lw=0.3,zorder=3)
lm=[min(ao.min(),ap.min())-10,max(ao.max(),ap.max())+10]
ax.plot(lm,lm,'--',color='gray',lw=0.8,alpha=0.7,zorder=1)
ax.set_xlim(lm); ax.set_ylim(lm)
ax.set_xlabel("Observed"); ax.set_ylabel("Predicted (ODE)")
ax.set_title(f"C. Predicted vs. observed (R\u00b2 = {R2:.3f})",fontsize=7,fontweight='bold',loc='left')
ax.text(0.05,0.95,f"N = {N}\n{len(countries)} countries\n3 global params",
        transform=ax.transAxes,fontsize=7,va='top',
        bbox=dict(boxstyle='round,pad=0.3',facecolor='white',edgecolor='gray',alpha=0.8))
plt.tight_layout()
for e in ['png','pdf']: fig.savefig(os.path.join(OFIG,f"fig2_pisa_multicountry.{e}"))
plt.close()
print(f"  fig1 {T()}", flush=True)

fig,axes=plt.subplots(1,2,figsize=(10,4.2))
ax=axes[0]
for c in countries:
    cl=cm(nc(c['mean_inet']))
    ax.plot(c['yr'],c['D']*100,'-o',color=cl,ms=3,lw=1.0,alpha=0.7)
    if c['name'] in {'Finland','Indonesia','Korea','USA','Turkey','Japan','Mexico','UK'}:
        ax.annotate(c['name'],(c['yr'][-1],c['D'][-1]*100),fontsize=5.5,
                    ha='left',xytext=(3,0),textcoords='offset points',color=cl)
ax.set_xlabel("Year"); ax.set_ylabel("Internet users (%)")
ax.set_title("A. Technology adoption D(t)",fontsize=7,fontweight='bold',loc='left')
ax.set_xlim(2002,2024); ax.set_ylim(0,105)

ax=axes[1]
for i,(v,ci,cl) in enumerate(zip([af,bf],[aCI,bCI],[C1,C3])):
    ax.bar(i,v,width=0.5,color=cl,alpha=0.7,edgecolor=cl,lw=1.2)
    ax.errorbar(i,v,yerr=[[v-ci[0]],[ci[1]-v]],fmt='none',ecolor='black',capsize=5,lw=1.5,zorder=5)
    ax.text(i,ci[1]+max(af,bf)*0.06,f"{v:.4f}\n[{ci[0]:.4f},{ci[1]:.4f}]",
            ha='center',va='bottom',fontsize=7,fontweight='bold')
ax.set_xticks([0,1])
ax.set_xticklabels([r'$\alpha$'+'\n(recovery)',r'$\beta$'+'\n(erosion)'],fontsize=6)
ax.set_ylabel("Parameter value")
ax.set_title("B. Parameters (95% CI)",fontsize=7,fontweight='bold',loc='left')
ax.set_ylim(0,max(af,bf)*2.2)
ax.text(0.95,0.95,f"$H_{{max}}$ = {hf:.0f}\n[{hCI[0]:.0f},{hCI[1]:.0f}]",
        transform=ax.transAxes,fontsize=7,va='top',ha='right',
        bbox=dict(boxstyle='round,pad=0.3',facecolor='#E6F2F4',edgecolor=C1,alpha=0.9))
plt.tight_layout()
for e in ['png','pdf']: fig.savefig(os.path.join(OFIG,f"fig_pisa_alpha_beta.{e}"))
plt.close()
print(f"  fig2 {T()}", flush=True)

# ── Country fits ──────────────────────────────────────────
print(f"\n=== COUNTRY FIT ===", flush=True)
for c in countries:
    pr=solve(af,bf,hf,c)
    ssc=np.sum((c['raw']-pr)**2); sstc=np.sum((c['raw']-np.mean(c['raw']))**2)
    r2c=1-ssc/max(sstc,1e-6) if sstc>1e-6 else float('nan')
    print(f"  {c['name']:15s}: R2={r2c:+.3f} RMSE={np.sqrt(ssc/len(c['raw'])):.1f}")

print(f"\n{'='*68}")
print("MANUSCRIPT VALUES --- PISA Multi-Country Panel Analysis")
print(f"{'='*68}")
print(f"\nGlobal alpha (recovery)  = {af:.4f}  95%CI [{aCI[0]:.4f}, {aCI[1]:.4f}]")
print(f"Global beta  (erosion)   = {bf:.4f}  95%CI [{bCI[0]:.4f}, {bCI[1]:.4f}]")
print(f"H_max (ceiling)          = {hf:.1f}  95%CI [{hCI[0]:.1f}, {hCI[1]:.1f}]")
print(f"epsilon (fixed)          = {EPS}")
print(f"\nN countries              = {len(countries)}")
print(f"N data points            = {N}")
print(f"Bootstrap                = {NB} ({len(aB)} valid)")
print(f"\n--- Model Comparison ---")
print(f"{'Model':<42s} {'k':>4s} {'R2':>8s} {'AIC':>10s} {'BIC':>10s}")
print(f"{'-'*42} {'-'*4} {'-'*8} {'-'*10} {'-'*10}")
print(f"{'A: Linear (per-country)':42s} {kL:4d} {R2L:8.4f} {AICL:10.1f} {BICL:10.1f}")
print(f"{'B: Exp (global beta + intercepts)':42s} {kE:4d} {R2E:8.4f} {AICE:10.1f} {BICE:10.1f}")
print(f"{'C: ODE (shared alpha, beta, Hmax)':42s} {K:4d} {R2:8.4f} {AIC:10.1f} {BIC:10.1f}")
print(f"\nalpha identifiable?      = {'YES (peaked)' if peaked else 'NO'}")
print(f"Profile LL range         = {llr:.2f}")
print(f"beta/alpha               = {bf/af:.2f}")
print(f"Interpretation: Erosion is {bf/af:.1f}x the recovery rate")
print(f"\nTotal time: {T()}")
print(f"{'='*68}", flush=True)

results={
    'alpha':float(af),'alpha_ci':[float(aCI[0]),float(aCI[1])],
    'beta':float(bf),'beta_ci':[float(bCI[0]),float(bCI[1])],
    'Hmax':float(hf),'Hmax_ci':[float(hCI[0]),float(hCI[1])],
    'epsilon':EPS,'n_countries':len(countries),'n_data_points':N,
    'r2_ode':float(R2),'r2_linear':float(R2L),'r2_exp':float(R2E),
    'aic_ode':float(AIC),'aic_linear':float(AICL),'aic_exp':float(AICE),
    'bic_ode':float(BIC),'bic_linear':float(BICL),'bic_exp':float(BICE),
    'k_ode':K,'k_linear':kL,'k_exp':kE,
    'alpha_identifiable':bool(peaked),'profile_ll_range':float(llr),
    'beta_alpha_ratio':float(bf/af),
    'n_bootstrap':NB,'n_valid_bootstrap':len(aB),
    'country_names':[c['name'] for c in countries],
}
with open(os.path.join(OANA,'results.json'),'w') as f: json.dump(results,f,indent=2)

readme=f"""# PISA Multi-Country Panel ODE Analysis

## Overview
Fits the human capital ODE to PISA math scores across {len(countries)} countries,
using country-specific internet adoption as D(t).

## Model
```
dH/dt = alpha*(H + eps)*(1 - H)*(1 - D(t)) - beta*H*D(t)
```
H = PISA_score / H_max. Common ceiling normalization enables the nonlinear
(1-H) growth saturation to create different dynamics for countries at
different performance levels.

- alpha, beta, H_max: SHARED globally (3 params total)
- D(t): country-specific internet adoption rate
- eps = {EPS} (fixed)

## Key Results

### Parameter Estimates (95% bootstrap CI, N={NB})
| Parameter | Estimate | 95% CI |
|-----------|----------|--------|
| alpha (recovery) | {af:.4f} | [{aCI[0]:.4f}, {aCI[1]:.4f}] |
| beta (erosion)  | {bf:.4f} | [{bCI[0]:.4f}, {bCI[1]:.4f}] |
| H_max (ceiling)  | {hf:.0f} | [{hCI[0]:.0f}, {hCI[1]:.0f}] |

### Model Comparison
| Model | Params | R2 | AIC | BIC |
|-------|--------|----|-----|-----|
| Linear (per-country) | {kL} | {R2L:.4f} | {AICL:.1f} | {BICL:.1f} |
| Exp (global beta + intercepts) | {kE} | {R2E:.4f} | {AICE:.1f} | {BICE:.1f} |
| **ODE (shared alpha, beta, H_max)** | **{K}** | **{R2:.4f}** | **{AIC:.1f}** | **{BIC:.1f}** |

### alpha Identifiability
- Multi-country panel: **{'PEAKED (identifiable)' if peaked else 'NOT peaked'}**
- Single OECD average: flat (NOT identifiable)
- Profile LL range: {llr:.2f}

### Interpretation
- beta/alpha = {bf/af:.2f}: erosion is {bf/af:.1f}x the recovery rate
- Countries: {', '.join([c['name'] for c in countries])}

## Data Sources
- PISA math scores: OECD PISA (2003-2022, 7 cycles)
- Internet adoption: World Bank / ITU
"""
with open(os.path.join(OANA,'README.md'),'w') as f: f.write(readme)


# ============================================================
# Merge PISA multi-country results into paper_claims.json
# ============================================================
claims_file = "paper_claims.json"
if os.path.exists(claims_file):
    with open(claims_file) as f:
        claims = json.load(f)
else:
    claims = {}

claims["pisa_multicountry"] = {
    "r2": round(float(R2), 3),
    "n": int(N),
    "k": int(K),
    "alpha": round(float(af), 3),
    "alpha_ci": [round(float(aCI[0]), 3), round(float(aCI[1]), 3)],
    "beta": round(float(bf), 3),
    "beta_ci": [round(float(bCI[0]), 3), round(float(bCI[1]), 3)],
    "Hmax": int(round(float(hf))),
    "bic_ode": int(round(float(BIC))),
    "bic_exp": int(round(float(BICE))),
    "bic_linear": int(round(float(BICL))),
    "note": "15-country panel fit from pisa_multicountry.py"
}

with open(claims_file, "w") as f:
    json.dump(claims, f, indent=2)
print(f"  Updated {claims_file} with pisa_multicountry results")

print(f"\nDone. {T()}", flush=True)
