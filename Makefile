dist=out

all: ${dist}/flatly.html

${dist}/%.css:
	nix-shell release.nix -A env --run "lessc -s --global-var=\"bsw-root='https://raw.githubusercontent.com/thomaspark/bootswatch/gh-pages'\" src/less/styles/flatly/styles.less $@"

${dist}/%.html: ${dist}/%.css
	asciidoctor -a stylesheet=../$< -o $@ test/test.adoc

clean:
	rm -rf ${dist}
