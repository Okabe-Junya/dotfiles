.PHONY : init clean build-osx build-linux check-scripts check-scripts-all

init:
	@echo "Initializing..."

build-osx:
	@echo "Building for OSX..."

build-linux:
	@echo "Building for Linux..."

check-scripts:
	shellcheck -e SC2148 **/*.sh

check-scripts-all:
	shellcheck **/*.sh

clean:
	@echo "Cleaning..."
