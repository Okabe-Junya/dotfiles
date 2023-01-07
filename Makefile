.PHONY : init clean build check-scripts check-scripts-all

init:
	@echo "Initializing..."
	./init/symlink.sh

build: init
	@echo "Building for OSX..."
	./init/init.sh
	./init/brew.sh
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
