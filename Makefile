coffee-watch:
	coffee --watch --compile --output htdocs/js/lib/ src/

coffee-compile:
	coffee --compile --output htdocs/js/lib/ src/

.PHONY: coffee-watch coffee-compile
