.PHONY : init clean build check-scripts check-scripts-all

init:
	@echo "Initializing..."
	./init/symlink.sh
	./init/init.sh

build: init
	@echo "Building for OSX..."
	./init/brew.sh
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
