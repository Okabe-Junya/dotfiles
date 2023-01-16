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

check-scripts-all:
	shellcheck **/*.sh

clean:
	@echo "Cleaning..."

clean_up:
	@echo "Brew Cleaning up..."
	brew bundle cleanup --force --file Brewfile
