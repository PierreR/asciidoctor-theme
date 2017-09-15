all: page_1.html page_2.html menu.html

css/flatly.css:
	nix-shell release.nix -A env --run "lessc -s --global-var=\"bsw-root='https://raw.githubusercontent.com/thomaspark/bootswatch/gh-pages'\" src/less/styles/flatly/styles.less $@"

%.html: src/%.adoc css/flatly.css
	asciidoctor -a linkcss -a stylesheet=css/flatly.css -o $@ $<

clean:
	rm -rf css
