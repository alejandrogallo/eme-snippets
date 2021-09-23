let types = ../types.dhall

in    [ { language = types.Language.python, snippet = ./python.dhall }
      , { language = types.Language.cpp, snippet = ./cpp.dhall }
      ]
    : List types.LanguageImpl
