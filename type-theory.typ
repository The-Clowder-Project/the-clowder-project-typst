#set heading(numbering: "1.")
#let author = [The Clowder Project Authors]
#let date = datetime.today()

#import "@preview/theorion:0.4.0": *
#import "@preview/curryst:0.5.1": rule, prooftree
#import cosmos.clouds: *
#import cosmos.fancy: *
#import cosmos.rainbow: *
#import cosmos.simple: *
#show: show-theorion

#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  "Definition",
  inherited-levels: 2,
  inherited-from: heading,
  render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
)
#show: show-definition

/// Custom color and block style
#let definition-box = definition-box.with(
  fill: blue.lighten(85%),
  radius: 0pt,
)

#let (example-counter, example-box, example, show-example) = make-frame(
  "example",
  "Example",
  inherited-levels: 2,
  inherited-from: heading,
  render: (prefix: none, title: "", full-title: auto, body) => [#strong[#full-title.]#sym.space#emph(body)],
)
#show: show-example

/// Custom color and block style
#let example-box = example-box.with(
  fill: green.lighten(85%),
  radius: 0pt,
)
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
  An *inference rule* is written in the form
  #prooftree(
    rule(
      name: "name",
      $cal(C)$,
      $cal(H)_1$,
      $cal(H)_2$,
      $dots$,
      $cal(H)_n$,
    )
  )
  and represents a deduction going from a finite list $cal(H)_1$, $dots$, $cal(H)_n$ of *judgements* for the *premises* to a *conclusion* $C$, which is itself a (single) judgement.
]

#example(title: "An Inference Rule for Function Types")[
  The inference rule
  #prooftree(
    rule(
      name: "ev2",
      $Gamma |- f(a): B$,
      $Gamma |- a: A$,
      $Gamma |- f: A -> B$,
    )
  )
  works as follows. In the _context_ $Gamma$, we start with:
  - A term $a$ of type $A$;
  - A term $f$ of type $A -> B$;

  and then obtain a term $f(a)$ of type $B$.
]
== Contexts <subsection-contexts>
#definition(title: "Contexts")[
  A *context* is a finite list#footnote[There is, in particular, the empty context.] of *variable declarations*
  - $a_1: A_1$;
  - $a_2: A_2(x_1)$;
  - $...$;
  - $a_k: A_k(x_(k-1))$;

  such that, for each $1 <= k <= n$, we may derive the judgement
  $ x_1: A_1, ..., x_(k-1): A_(k-1)(x_1, ..., x_(k-2)) |- A_k(x_1, ..., x_(k-1)) "type" $
]
== Type Families <subsection-type-families>
#definition(title: "Type Families and Sections")[
  Let $A$ be a type in a context $Gamma$.
  + A *family of types over* $A$ in context $Gamma$ is a type $B(x)$ in context $Gamma, x: A$.#footnote[*Further Terminology:* We also say that $B(x)$ is a type *indexed* by $x: A$ in context $Gamma$.]
  + A *section* of a type family $B$ over $A$ in context $Gamma$ is a term $b(x)$ of type $B(x)$ in context $Gamma, x: A$.#footnote[*Further Terminology:* We also say that $b(x)$ is a term of type $B(x)$ *indexed* by $x: A$ in context $Gamma$.]
]

#example(title: "Identity Types")[
  Identity types are introduced as
  #prooftree(
    rule(
      name: "id-form",
      $Gamma, x: A |- a =_A x "type"$,
      $Gamma |- a: A$,
    )
  ).
  So $a =_A x$ is a type indexed over $x: A$.
]
== Derivations <subsection-derivations>
#definition(title: "Derivations")[
  A *derivation* is a finite tree having rules of inference as nodes.
]

#example(title: "Changing Variables in Martin-Löf Type Theory")[
  The inference rule
  #prooftree(
    rule(
      name: "CV",
      $Gamma, a: A, Delta[a/x] |- cal(J)[a/x]$,
      $Gamma, x: A, Delta |- cal(J)$,
    )
  )
  admits the following derivation:
  #prooftree(
    rule(
      name: "S",
      $Gamma, a: A, Delta[a/x] |- cal(J)[a/x]$,
      rule(
        name: "G",
        $Gamma, a: A |- a: A$,
        $Gamma |- A "type"$,
      ),
      rule(
        name: "W",
        $Gamma, x: A, a: A, Delta |- cal(J)$,
        $Gamma, x: A |- cal(J)$,
      )
    )
  ).
]

#example(title: "Interchanging Variables in Martin-Löf Type Theory")[
  The inference rule
  #prooftree(
    rule(
      name: "IV",
      $Gamma, y:B, x:A, Delta |- cal(J)$,
      $Gamma |- B "type"$,
      $Gamma, x:A, y:B, Delta |- cal(J)$,
    )
  )
  admits the following derivation:
  #prooftree(
    rule( // S
      name: "S",
      $Gamma, y:B, x:A, Delta |- cal(J)$,
      rule( // W1 from G
        name: "W",
        $Gamma, y:B, x:A |- y:B$,
        rule( // G
          name: "G",
          $Gamma, y:B |- y:B$,
          $Gamma |- B "type"$,
        ),
      ),
      rule( // W2 from B type and CV
        name: "W",
        $Gamma, y:B, x:A, y':B, Delta[y'/y] |- cal(J)[y'/y]$,
        $Gamma |- B "type"$,
        rule( // CV
          name: "CV",
          $Gamma, x:A, y':B, Delta[y'/y] |- cal(J)[y'/y]$,
          $Gamma, x:A, y:B, Delta |- cal(J)$,
        ),
      ),
    )
  ).
]
