phony: clean html

all: html

html:
	@nix-shell release.nix -A env --run "build/build.sh html"

clean:
	@rm -rf css
