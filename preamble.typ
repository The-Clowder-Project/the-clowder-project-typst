#set heading(numbering: "1.")
#let author = [The Clowder Project Authors]
#let date = datetime.today()
#import "@preview/theorion:0.4.0": *
#import cosmos.fancy: *
#show: show-theorion
#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  "Theorem",  // supplement, string or dictionary like `(en: "Theorem")`, or `theorion-i18n-map.at("definition")` for built-in i18n support
  counter: definition-counter,  // inherit the old counter, `none` by default
  inherited-levels: 2,  // useful when you need a new counter
  inherited-from: heading,  // heading or just another counter
  render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
)
#show: show-definition
