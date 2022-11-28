.PHONY : init clean

init:
	@echo "Initializing..."


clean:
	@echo "Cleaning..."


check-scripts:
	shellcheck -e SC2148 **/*.sh

check-scripts-all:
	shellcheck **/*.sh
