.DEFAULT_GOAL := setup-osx

.PHONY: init-osx
init-osx:
	@echo "Initializing..."
	./init/symlink.sh
	./init/init.sh

.PHONY: setup-osx
setup-osx: init-osx
	@echo "Setup for OSX..."
	./init/brew.sh

.PHONY: setup-linux
setup-linux:
	@echo "Setup for Linux..."
	./init/symlink.sh

.PHONY: setup-osx-minimal
setup-osx-minimal:
	@echo "Setup for OSX Minimal..."
	./init/brew_min.sh
	./init/pyenv.sh

.PHONY: lint
lint:
	shellcheck -e SC2148 **/*.sh
	flake8 **/*.py

.PHONY: format
format: lint
	shfmt -w -i 4 **/*.sh
	black **/*.py

.PHONY: clean
clean:
	@echo "Cleaning..."

.PHONY: clean-up-brew
clean-up-brew:
	@echo "Brew Cleaning up..."
	brew bundle cleanup --force --file Brewfile
