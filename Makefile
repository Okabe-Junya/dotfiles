DEFAULT: install-all

.PHONY: install-all
install-all:
	@echo "Installing all dependencies and Setting up"
	./install.zsh

.PHONY: symlink
symlink:
	@echo "Setting up symlinks"
	./install/symlink.zsh

.PHONY: dependency-check
dependency-check:
	@echo "Checking dependencies"
	./.zsh/dependency-check.zsh

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  install-all: Install all dependencies and setup"
	@echo "  symlink: Create symlinks"
	@echo "  dependency-check: Check dependencies"
	@echo "  help: Show this help message"
