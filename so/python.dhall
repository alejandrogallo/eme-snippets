let common =
      { body =
          ''
          print(''${1:"''${2}"})$0
          ''
      }

let ultisnip = common with mode = "w"

let yas = common

in  { ultisnip, yas }
