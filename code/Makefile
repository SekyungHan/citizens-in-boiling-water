.PHONY: all figures clean

all: figures

figures:
	python3 generate_all_figures_unified.py
	python3 pisa_multicountry.py
	python3 model_discrimination.py
	python3 generate_claims_macros.py
	@echo "All figures generated in paper_figures/"

clean:
	rm -rf paper_figures/ paper/ analyses/ data/epsilon_sensitivity_results.json paper_claims.json
