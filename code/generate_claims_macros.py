#!/usr/bin/env python3
"""
Generate LaTeX macros from paper_claims.json.
Run after generate_all_figures_unified.py to keep macros in sync.

Usage:
    python3 generate_claims_macros.py
    # → writes paper/claims_macros.tex
"""
import json, os, sys, re

CLAIMS_FILE = "paper_claims.json"
OUTPUT_FILE = os.path.join("paper", "claims_macros.tex")


def to_macro_name(section: str, key: str) -> str:
    """Convert section.key to a LaTeX macro name (camelCase-ish, readable)."""
    MANUAL = {
        # params_global
        ("params_global", "alpha"): "paramAlpha",
        ("params_global", "beta"): "paramBeta",
        ("params_global", "delta"): "paramDelta",
        ("params_global", "epsilon"): "paramEpsilon",
        ("params_global", "gen_rate"): "paramGenRate",
        ("params_global", "N"): "paramN",
        ("params_global", "T"): "paramT",
        ("params_global", "n_reps"): "paramNreps",
        # k_sweep
        ("k_sweep", "s"): "sweepScope",
        ("k_sweep", "delta"): "sweepDelta",
        ("k_sweep", "c"): "sweepCost",
        ("k_sweep", "H0"): "sweepHzero",
        ("k_sweep", "crisis_prob"): "sweepCrisisProb",
        ("k_sweep", "n_grid"): "sweepNgrid",
        ("k_sweep", "K_star"): "Kstar",
        ("k_sweep", "dHdK_max"): "dHdKmax",
        ("k_sweep", "K_star_focused"): "KstarFocused",
        ("k_sweep", "dHdK_max_focused"): "dHdKmaxFocused",
        ("k_sweep", "focused_n_grid"): "sweepFocusedNgrid",
        ("k_sweep", "H_at_K085"): "HatKeightyfive",
        ("k_sweep", "H_at_K090"): "HatKninety",
        ("k_sweep", "H_at_K095"): "HatKninetyfive",
        # antifragility
        ("antifragility", "s"): "afScope",
        ("antifragility", "delta"): "afDelta",
        ("antifragility", "K"): "afK",
        ("antifragility", "H_0pct"): "afHzeroPct",
        ("antifragility", "H_5pct"): "afHfivePct",
        ("antifragility", "H_12pct"): "afHtwelvePct",
        ("antifragility", "H_20pct"): "afHtwentyPct",
        ("antifragility", "H_25pct"): "afHtwentyfivePct",
        ("antifragility", "fold_25pct"): "afFold",
        # policy
        ("policy", "s"): "polScope",
        ("policy", "delta"): "polDelta",
        ("policy", "K"): "polK",
        ("policy", "crisis_prob"): "polCrisisProb",
        ("policy", "H_baseline"): "polBaseline",
        ("policy", "H_10pct"): "polHten",
        ("policy", "pct_10pct"): "polPctTen",
        ("policy", "H_20pct"): "polHtwenty",
        ("policy", "pct_20pct"): "polPctTwenty",
        ("policy", "H_30pct"): "polHthirty",
        ("policy", "pct_30pct"): "polPctThirty",
        ("policy", "H_40pct"): "polHforty",
        ("policy", "pct_40pct"): "polPctForty",
        # calibration
        ("calibration", "beta_education"): "calBetaEducation",
        ("calibration", "beta_endoscopy"): "calBetaEndoscopy",
        ("calibration", "beta_spatial"): "calBetaSpatial",
        ("calibration", "beta_aviation"): "calBetaAviation",
        # biology
        ("biology", "buchnera_genes_ancestral"): "bioGenesAncestral",
        ("biology", "buchnera_genes_current"): "bioGenesCurrent",
        ("biology", "genome_reduction_pct"): "bioReductionPct",
        # pisa_oecd_avg
        ("pisa_oecd_avg", "r2"): "pisaOecdRsq",
        ("pisa_oecd_avg", "n"): "pisaOecdN",
        ("pisa_oecd_avg", "k"): "pisaOecdK",
        ("pisa_oecd_avg", "alpha"): "pisaOecdAlpha",
        ("pisa_oecd_avg", "beta"): "pisaOecdBeta",
        ("pisa_oecd_avg", "Hmax"): "pisaOecdHmax",
        ("pisa_oecd_avg", "bic_ode"): "pisaOecdBicOde",
        ("pisa_oecd_avg", "bic_exp"): "pisaOecdBicExp",
        ("pisa_oecd_avg", "bic_linear"): "pisaOecdBicLinear",
        # pisa_multicountry
        ("pisa_multicountry", "r2"): "pisaRsq",
        ("pisa_multicountry", "n"): "pisaN",
        ("pisa_multicountry", "k"): "pisaK",
        ("pisa_multicountry", "alpha"): "pisaAlpha",
        ("pisa_multicountry", "beta"): "pisaBeta",
        ("pisa_multicountry", "Hmax"): "pisaHmax",
        ("pisa_multicountry", "bic_ode"): "pisaBicOde",
        ("pisa_multicountry", "bic_exp"): "pisaBicExp",
        ("pisa_multicountry", "bic_linear"): "pisaBicLinear",
        ("pisa_multicountry", "alpha_ci"): "pisaAlphaCi",
        ("pisa_multicountry", "beta_ci"): "pisaBetaCi",
    }
    result = MANUAL.get((section, key))
    if result:
        return result
    # Fallback: convert underscores to camelCase
    parts = (section + "_" + key).split("_")
    return parts[0] + "".join(p.capitalize() for p in parts[1:])


def format_value(val) -> str:
    """Format a value for LaTeX."""
    if isinstance(val, list):
        return f"{val[0]}--{val[1]}"
    if isinstance(val, float):
        # Keep one decimal for round numbers like 12.0
        if val == int(val) and val >= 10:
            return f"{val:.1f}"
        # Otherwise remove trailing zeros
        s = f"{val:.4f}".rstrip('0').rstrip('.')
        return s
    if isinstance(val, int):
        if val >= 1000:
            return f"{val:,}"
        return str(val)
    return str(val)


def main():
    if not os.path.exists(CLAIMS_FILE):
        print(f"ERROR: {CLAIMS_FILE} not found. Run generate_all_figures_unified.py first.")
        sys.exit(1)

    with open(CLAIMS_FILE) as f:
        claims = json.load(f)

    lines = [
        "% AUTO-GENERATED from paper_claims.json — DO NOT EDIT",
        "% Regenerate with: python3 generate_claims_macros.py",
        f"% Source: {CLAIMS_FILE}",
        "",
    ]

    skip_keys = {"K_range", "focused_range", "note"}

    for section, values in claims.items():
        lines.append(f"% ---- {section} ----")
        if not isinstance(values, dict):
            continue
        for key, val in values.items():
            if key in skip_keys:
                continue
            macro_name = to_macro_name(section, key)
            formatted = format_value(val)
            lines.append(f"\\newcommand{{\\{macro_name}}}{{{formatted}}}")
        lines.append("")

    os.makedirs(os.path.dirname(OUTPUT_FILE), exist_ok=True)
    with open(OUTPUT_FILE, "w") as f:
        f.write("\n".join(lines) + "\n")

    n_macros = sum(1 for l in lines if l.startswith("\\newcommand"))
    print(f"  {OUTPUT_FILE}: {n_macros} macros generated from {CLAIMS_FILE}")


if __name__ == "__main__":
    main()
