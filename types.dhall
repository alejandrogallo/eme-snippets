let WithKey = { key : Text }

let WithDescription = { description : Text }

let PreUltiSnip = { mode : Text, body : Text }

let UltiSnip = PreUltiSnip ⩓ WithKey ⩓ WithDescription

let PreYasSnippet = { body : Text }

let YasSnippet = PreYasSnippet ⩓ WithKey ⩓ WithDescription

let Language = ./languages.dhall

let PreSnippet = { yas : PreYasSnippet, ultisnip : PreUltiSnip }

let Snippet = { yas : YasSnippet, ultisnip : UltiSnip }

let RenderedSnippet = { yas : Text, ultisnip : Text }

let LanguageImpl = { language : Language, snippet : PreSnippet }

let Bundle = { bundle : List LanguageImpl } ⩓ WithKey ⩓ WithDescription

in  { PreUltiSnip
    , UltiSnip
    , PreYasSnippet
    , YasSnippet
    , PreSnippet
    , Snippet
    , RenderedSnippet
    , Language
    , LanguageImpl
    , Bundle
    , WithKey
    , WithDescription
    }
