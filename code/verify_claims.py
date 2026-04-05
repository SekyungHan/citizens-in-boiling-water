#!/usr/bin/env python3
"""
Verify that paper_claims.json, claims_macros.tex, and main.tex are in sync.
Usage: python3 verify_claims.py
"""
import json, os, re, sys

CLAIMS_FILE = "paper_claims.json"
MACROS_FILE = os.path.join("paper", "claims_macros.tex")
MAIN_FILE = os.path.join("paper", "main.tex")

errors = 0
warnings = 0


def error(msg):
    global errors
    errors += 1
    print(f"  ERROR: {msg}")


def warn(msg):
    global warnings
    warnings += 1
    print(f"  WARN:  {msg}")


# 1. Check claims.json exists
if not os.path.exists(CLAIMS_FILE):
    error(f"{CLAIMS_FILE} not found")
    sys.exit(1)

with open(CLAIMS_FILE) as f:
    claims = json.load(f)
print(f"[1] {CLAIMS_FILE}: {sum(len(v) for v in claims.values() if isinstance(v, dict))} values across {len(claims)} sections")

# 2. Check macros file exists and is in sync
if not os.path.exists(MACROS_FILE):
    error(f"{MACROS_FILE} not found — run: python3 generate_claims_macros.py")
else:
    with open(MACROS_FILE) as f:
        macros_content = f.read()

    # Extract all \newcommand{\name}{value} pairs
    macro_pairs = re.findall(r'\\newcommand\{\\(\w+)\}\{([^}]*)\}', macros_content)
    macro_dict = dict(macro_pairs)
    print(f"[2] {MACROS_FILE}: {len(macro_dict)} macros defined")

    # Check key values match
    key_checks = [
        ("pisaRsq", str(claims.get("pisa_multicountry", {}).get("r2", ""))),
        ("pisaAlpha", str(claims.get("pisa_multicountry", {}).get("alpha", ""))),
        ("pisaBeta", str(claims.get("pisa_multicountry", {}).get("beta", ""))),
        ("polBaseline", str(claims.get("policy", {}).get("H_baseline", ""))),
        ("afFold", str(claims.get("antifragility", {}).get("fold_25pct", ""))),
    ]
    for macro_name, expected in key_checks:
        actual = macro_dict.get(macro_name, "MISSING")
        if actual == "MISSING":
            error(f"Macro \\{macro_name} not found in {MACROS_FILE}")
        elif actual != expected:
            warn(f"Macro \\{macro_name}: {MACROS_FILE}={actual}, {CLAIMS_FILE}={expected}")

# 3. Check main.tex uses claims_macros
if not os.path.exists(MAIN_FILE):
    error(f"{MAIN_FILE} not found")
else:
    with open(MAIN_FILE) as f:
        main_content = f.read()

    if "\\input{claims_macros}" not in main_content:
        error(f"{MAIN_FILE} does not include \\input{{claims_macros}}")
    else:
        print(f"[3] {MAIN_FILE}: \\input{{claims_macros}} present")

    # Count macro usage
    used_macros = set()
    for macro_name in macro_dict:
        if f"\\{macro_name}" in main_content:
            used_macros.add(macro_name)
    print(f"[4] Macros used in main.tex: {len(used_macros)}/{len(macro_dict)}")

    # Check for potentially hardcoded key values
    hardcoded_checks = [
        (r'\$R\^2 = 0\.946\$', "R²=0.946 (should use \\pisaRsq)"),
        (r'\$\\beta = 0\.047\$', "beta=0.047 (should use \\calBetaEducation)"),
        (r'\$\\beta = 0\.020\$', "beta=0.020 (should use \\calBetaEndoscopy)"),
        (r'\$\\beta = 0\.010\$', "beta=0.010 (should use \\calBetaSpatial)"),
        (r'\$\\beta = 0\.002\$', "beta=0.002 (should use \\calBetaAviation)"),
        (r'\$H = 0\.127\$', "H=0.127 (should use \\afHzeroPct)"),
        (r'\$H = 0\.159\$', "H=0.159 (should use \\polBaseline)"),
        (r'\$H = 0\.305\$', "H=0.305 (should use \\polHtwenty)"),
        (r'\$H = 0\.528\$', "H=0.528 (should use \\polHforty)"),
    ]
    print("[5] Checking for hardcoded claim values in main.tex:")
    found_hardcoded = False
    for pattern, desc in hardcoded_checks:
        matches = re.findall(pattern, main_content)
        if matches:
            warn(f"Hardcoded: {desc} ({len(matches)} occurrence(s))")
            found_hardcoded = True
    if not found_hardcoded:
        print("    No hardcoded claim values found")

# Summary
print(f"\n{'='*50}")
if errors == 0 and warnings == 0:
    print("PASS: All claims verified")
elif errors == 0:
    print(f"PASS with {warnings} warning(s)")
else:
    print(f"FAIL: {errors} error(s), {warnings} warning(s)")
    sys.exit(1)
