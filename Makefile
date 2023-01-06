.PHONY : init clean build-osx build-linux check-scripts check-scripts-all

init:
	@echo "Initializing..."
	./init/symlink.sh

build-osx: init
	@echo "Building for OSX..."
	./init/brew.sh
	brew bundle --file Brewfile
	./init/pyenv.sh

build-linux: init
	@echo "Building for Linux..."

check-scripts:
	shellcheck -e SC2148 **/*.sh

check-scripts-all:
	shellcheck **/*.sh

clean:
	@echo "Cleaning..."

clean_up:
	@echo "Brew Cleaning up..."
	brew bundle cleanup --force --file Brewfile
