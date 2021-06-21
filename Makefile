.PHONY: help validate

BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

validate: ## Validate resource
	frictionless validate datapackage.json

build: 
	Rscript scripts/build.R $(BRANCH_NAME)

deploy: 
	git checkout gh-pages
	git add $(BRANCH_NAME)/*
	git commit -m "Atualiza branch $(BRANCH_NAME)"
	git push origin gh-pages

clean:	
	rm -rf public/