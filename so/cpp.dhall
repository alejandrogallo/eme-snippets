let common =
      { body =
          ''
          std::cout << ''${1} << "\n";
          ''
      }

let ultisnip = common with mode = "w"

let yas = common

in  { ultisnip, yas }
