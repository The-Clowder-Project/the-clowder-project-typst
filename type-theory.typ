#set heading(numbering: "1.")
#let author = [The Clowder Project Authors]
#let date = datetime.today()

#import "@preview/theorion:0.4.0": *
#import cosmos.clouds: *
#import cosmos.fancy: *
#import cosmos.rainbow: *
#import cosmos.simple: *
#show: show-theorion

#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  "Definition",
  counter: definition-counter,
  inherited-levels: 2,
  inherited-from: heading,
  render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
)
#show: show-definition

/// Custom color
#let definition = definition.with(fill: blue.lighten(85%))
#let definition-box = definition-box.with(fill: blue.lighten(85%))

/// Custom block style
#let definition = definition.with(radius: 0pt)
#let definition-box = definition-box.with(radius: 0pt)
// Actual content

#let title = [Type Theory]
#set text(font: "Alegreya Sans")
#set heading(numbering: "1.")

#align(center, text(17pt)[*#title*])
#align(center, text(12pt)[#author])
#align(center, text(12pt)[#date.display("[month repr:long] [day padding:none], [year]")])

This chapter contains material on type theory.

#outline()

= Type Theory Basics <section-type-theory-basics>
== Inference Rules <subsection-inference-rules>
#definition(title: "Inference Rules")[
  An inference rule
]
//\begin{definition}{Inference Rules}{inference-rules}%
//    An \index[type-theory]{inference rule}\textbf{inference rule} is written in the form
//    \begin{webprooftree}%
//        \begin{prooftree}%
//            \hypo{\mathcal{H}_{1}}%
//            \hypo{\mathcal{H}_{2}}%
//            \hypo{\ldots}%
//            \hypo{\mathcal{H}_{n}}%
//            \infer4[(name)]{\mathcal{C}}
//        \end{prooftree}%
//    \end{webprooftree}%
//    and represents a deduction going from a finite list $\mathcal{H}_{1}$, $\ldots$, $\mathcal{H}_{n}$ of \textbf{judgements} for the \textbf{premises} to a \textbf{conclusion} $\CatFont{C}$, which is itself a (single) judgement.
//\end{definition}
== Contexts <subsection-contexts>
== Type Families <subsection-type-families>
== Derivations <subsection-derivations>
