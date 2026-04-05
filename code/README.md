# Reproducibility Code

Simulation and analysis code for:

> **The enrichment paradox: critical capability thresholds and irreversible dependency in human–AI symbiosis**
>
> Jeongju Park, Musu Kim, Sekyung Han*
>
> Submitted to *Nature Human Behaviour*

## Quick start

```bash
pip install -r requirements.txt
make            # runs all simulations and generates figures
```

Or run scripts individually in order:

```bash
python3 generate_all_figures_unified.py   # Main simulation: Figs 1, 4–7, SI Figs S1–S4
python3 pisa_multicountry.py              # PISA 15-country panel analysis: Fig 2
python3 model_discrimination.py           # Model comparison (Linear/Exp/Logistic/ODE): Fig 3
python3 generate_claims_macros.py         # Generate LaTeX macros from paper_claims.json
```

Supplementary analysis scripts (run independently):

```bash
python3 two_skill_model.py                # SI: Two-skill comparative advantage
python3 pisa_profile_likelihood.py        # SI: Profile likelihood of alpha
```

## Requirements

- Python >= 3.9
- numpy >= 1.24
- scipy >= 1.10
- matplotlib >= 3.7

Tested with Python 3.10, numpy 1.26.4, scipy 1.15.3, matplotlib 3.10.8 on Ubuntu 22.04.

## Output

After running `make`, the following outputs are generated:

| Output | Description |
|--------|-------------|
| `paper_figures/*.png` | All manuscript and SI figures (PDF also generated) |
| `paper_claims.json` | All numerical claims in the manuscript (single source of truth) |
| `paper/claims_macros.tex` | LaTeX macros auto-generated from claims |
| `analyses/pisa_multicountry/` | PISA analysis results and country-level fits |

## Reproducibility

All simulations use deterministic seeding (`MASTER_SEED = 2026`). Running the code on any platform with the specified dependencies should produce identical numerical results and figures.

### Key numerical outputs to verify

| Claim | Expected value |
|-------|---------------|
| K* (critical threshold) | ~0.85 |
| PISA multi-country R² | 0.946 |
| Antifragility fold (25% crisis) | 2.7x |
| Policy 20% practice → capability gain | +92% |

## Data sources

- `data/pisa_timeseries.csv` — OECD PISA math scores (2003–2022), 8 cycles, source: [OECD PISA](https://www.oecd.org/pisa/)
- `data/calibration_results.json` — Decay rates (β) estimated from four published studies (see manuscript Table 1)
- `data/k_operationalization.json` — AI capability K mapping from GPT benchmark scores (MMLU, HumanEval, etc.)

## Code structure

```
generate_all_figures_unified.py  — Core ODE + ABM simulation engine
                                   Generates Figs 1, 4–7 and SI Figs S1–S4
                                   Writes paper_claims.json (all manuscript numbers)

pisa_multicountry.py             — 15-country PISA panel ODE fit
                                   Differential evolution + bootstrap CI
                                   Generates Fig 2

model_discrimination.py          — AIC/BIC comparison: Linear vs Exp vs Logistic vs ODE
                                   Recovery prediction + threshold behavior
                                   Generates Fig 3

generate_claims_macros.py        — Converts paper_claims.json → LaTeX \newcommand macros
verify_claims.py                 — Checks claims ↔ macros ↔ manuscript sync
two_skill_model.py               — SI: Two-skill comparative advantage counter-analysis
pisa_profile_likelihood.py       — SI: Single-country profile likelihood (non-identifiability)
```

## License

MIT
