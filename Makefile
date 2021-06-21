.PHONY: help validate

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

validate: ## Validate resource
	frictionless validate datapackage.json

build: 
	Rscript -e 'rmarkdown::render("index.Rmd", output_dir = "public")'

deploy: 
	git checkout gh-pages

clean:	
	rm -rf public/