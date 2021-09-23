let WithKey = { key : Text }

let PreUltiSnip = { mode : Text, body : Text }

let UltiSnip = PreUltiSnip ⩓ WithKey

let PreYasSnippet = { body : Text }

let YasSnippet = PreYasSnippet ⩓ WithKey

let Language = ./languages.dhall

let PreSnippet = { yas : PreYasSnippet, ultisnip : PreUltiSnip }

let Snippet = PreSnippet → WithKey → { yas : YasSnippet, ultisnip : UltiSnip }

let LanguageImpl = { language : Language, snippet : PreSnippet }

let Bundle = { description : Text, key : Text, bundle : List LanguageImpl }

in  { UltiSnip, YasSnippet, Snippet, Language, LanguageImpl, Bundle }
