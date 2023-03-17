# Run docs generator
.PHONY: docs
docs:
	@echo "Running docs generator"
ifeq (, $(shell which helm-docs))
	@echo "Missing helm-docs on PATH, to generate docs install helm-docs: https://github.com/norwoodj/helm-docs"
	exit 1
endif
	helm-docs
