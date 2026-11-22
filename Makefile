.DEFAULT_GOAL := install-all

.PHONY: install-all
install-all: ## Install all dependencies and setup
	@echo "Installing all dependencies and Setting up"
	./install.zsh

.PHONY: symlink
symlink: ## Create symlinks
	@echo "Setting up symlinks"
	./install/symlink.zsh

.PHONY: dependency-check
dependency-check: ## Check dependencies
	@echo "Checking dependencies"
	./.zsh/dependency-check.zsh

.PHONY: macos
macos: ## Apply macOS system preferences
	@echo "Applying macOS system preferences"
	./install/macos.zsh

.PHONY: help
help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@awk -F ':.*## ' '/^[a-z-]+:.*## / { printf "  %s: %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
