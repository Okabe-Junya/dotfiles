.PHONY : init clean build-osx build-linux check-scripts check-scripts-all

init:
	@echo "Initializing..."
	./init/symlink.sh

build-osx:
	@echo "Building for OSX..."

build-linux:
	@echo "Building for Linux..."

lint:
	shellcheck -e SC2148 **/*.sh
	flake8 **/*.py

format: lint
	shfmt -w -i 4 **/*.sh
	black **/*.py

clean:
	@echo "Cleaning..."
