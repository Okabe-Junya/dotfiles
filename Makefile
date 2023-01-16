.PHONY : init clean build check-scripts check-scripts-all

.DEFAULT_GOAL := build-minimal

init:
	@echo "Initializing..."
	./init/symlink.sh
	./init/init.sh

build: init
	@echo "Building for OSX..."
	./init/brew.sh
	./init/pyenv.sh
	./init/code_extensions.sh

build-minimal: init
	@echo "Building minimal for OSX..."
	./init/brew_min.sh
	./init/pyenv.sh
	./init/code_extensions.sh

check-scripts:
	shellcheck -e SC2148 **/*.sh
	flake8 **/*.py

format: lint
	shfmt -w -i 4 **/*.sh
	black **/*.py

clean:
	@echo "Cleaning..."

clean_up:
	@echo "Brew Cleaning up..."
	brew bundle cleanup --force --file Brewfile

clean_up_min:
	@echo "Brew Cleaning up..."
	brew bundle cleanup --force --file ~/dotfiles/init/min/Brewfile
