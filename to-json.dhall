let types = ./types.dhall

let snippets = ./snippets.dhall

let map =
      https://prelude.dhall-lang.org/v20.2.0/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let WithKD = types.WithKey ⩓ types.WithDescription

let render-ultisnip
    : types.UltiSnip → Text
    = λ(s : types.UltiSnip) →
        ''
        snippet ${s.key} "${s.description}" ${s.mode}
        ${s.body}
        endsnippet
        ''

let render-yas
    : types.YasSnippet → Text
    = λ(s : types.YasSnippet) →
        ''
        # -*- mode: snippet -*-
        # name: ${s.description}
        # key: ${s.key}
        # --

        ${s.body}
        ''

let render-snippet
    : types.Snippet → types.RenderedSnippet
    = λ(s : types.Snippet) →
        { yas = render-yas s.yas, ultisnip = render-ultisnip s.ultisnip }

let apply-key-and-description
    : WithKD → types.PreSnippet → types.Snippet
    = λ(kd : WithKD) →
      λ(s : types.PreSnippet) →
        { yas = s.yas ∧ kd, ultisnip = s.ultisnip ∧ kd } : types.Snippet

let RenderedImpl =
      { language : types.Language, snippet : types.RenderedSnippet }

let render-impl
    : WithKD → types.LanguageImpl → RenderedImpl
    = λ(kd : WithKD) →
      λ(i : types.LanguageImpl) →
        let snippet = apply-key-and-description kd i.snippet

        in  { language = i.language, snippet = render-snippet snippet }

let RenderedBundle = { bundle : List RenderedImpl } ⩓ WithKD

let render-bundle
    : types.Bundle → RenderedBundle
    = λ(b : types.Bundle) →
        let kd = { key = b.key, description = b.description }

        in  b
          with bundle =
              map types.LanguageImpl RenderedImpl (render-impl kd) b.bundle

let render-snippets = map types.Bundle RenderedBundle render-bundle

in  render-snippets snippets
