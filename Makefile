.PHONY: all
all: dist

dist: snippets.json
	./generate.py

snippets.json: ./to-json.dhall snippets.dhall
	dhall-to-json < ./to-json.dhall > $@
