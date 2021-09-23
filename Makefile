.PHONY: all
all: snippets.json

snippets.json: ./to-json.dhall
%.json: %.dhall
	dhall-to-json < $< > $@
