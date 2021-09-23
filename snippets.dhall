let types = ./types.dhall

in    [ { key = "so"
        , description = "Standard output"
        , bundle = ./so/package.dhall
        }
      ]
    : List types.Bundle
