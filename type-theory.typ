#set heading(numbering: "1.")
#let author = [The Clowder Project Authors]
#let date = datetime.today()

#set page(margin: 4.25cm)
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
#show heading: set block(above: 1.4em, below: 1em)

#import "@preview/theorion:0.4.0": *
#import "@preview/curryst:0.5.1": rule, prooftree
#show: show-theorion

// --- Custom Theorem Environments ---

// Colors from LaTeX preamble
#let defColor = rgb("#4D4D80")
#let conColor = rgb("#806605")
#let thmColor = rgb("#A60D0D")
#let othColor = rgb("#803300")
#let oldtagColor = rgb(153, 137, 101)
#let gapColor = rgb(168, 50, 88)
#let motivationColor = rgb(0, 128, 201)
#let explanationColor = rgb(0, 123, 117)
#let corColor = rgb(82, 0, 122)
#let notColor = rgb(212, 97, 166)
#let queColor = rgb(0, 163, 175)
#let remColor = rgb("#338033")
#let warColor = rgb(0, 0, 0)
#let prfColor = rgb("#595959")
#let conjColor = rgb(195, 50, 145)
#let backgroundColor = white // Assuming white as per analysis

// Helper function to create theorem environments
#let make-theorem-env(name, supplement, color, counter: none) = {
  let (counter, box, theorem, show-theorem) = make-frame(
    name,
    supplement,
    counter: counter,
    inherited-levels: 3,
    inherited-from: heading,
    render: (prefix: none, title: "", full-title: auto, body) => {
      let title-content = if title != none and title != "" {
        [#full-title: #title]
      } else {
        full-title
      }
      block(
        width: 100%,
        breakable: true,
        inset: 0pt,
        radius: 0pt,
        stroke: (paint: color, thickness: 1pt),
        [
          #block(
            width: 100%,
            fill: color,
            inset: (x: 8pt, y: 5pt),
            radius: 0pt,
            [
              #text(font: "Alegreya Sans SC", weight: "bold", fill: white)[
                #title-content
              ]
              #h(1fr)
              #text(fill: white)[#sym.space$triangle$]
            ]
          ),
          #block(
            width: 100%,
            fill: backgroundColor,
            inset: 8pt,
            radius: 0pt,
            body
          )
        ]
      )
    }
  )
  // Return the created functions and counters
  (counter, box, theorem, show-theorem)
}

// Definition
#let (definition-counter, definition-box, definition, show-definition) = make-theorem-env(
  "definition",
  "Definition",
  defColor
)
#show: show-definition

// Share counter between theorem environments
#let shared-counter = definition-counter

#let (question-counter, question-box, question, show-question) = make-theorem-env("question", "Question", queColor, counter: shared-counter)
#show: show-question
#let (lemma-counter, lemma-box, lemma, show-lemma) = make-theorem-env("lemma", "Lemma", thmColor, counter: shared-counter)
#show: show-lemma
#let (corollary-counter, corollary-box, corollary, show-corollary) = make-theorem-env("corollary", "Corollary", corColor, counter: shared-counter)
#show: show-corollary
#let (theorem-counter, theorem-box, theorem, show-theorem) = make-theorem-env("theorem", "Theorem", thmColor, counter: shared-counter)
#show: show-theorem
#let (notation-counter, notation-box, notation, show-notation) = make-theorem-env("notation", "Notation", notColor, counter: shared-counter)
#show: show-notation
#let (remark-counter, remark-box, remark, show-remark) = make-theorem-env("remark", "Remark", remColor, counter: shared-counter)
#show: show-remark
#let (remarks-counter, remarks-box, remarks, show-remarks) = make-theorem-env("remarks", "Remarks", remColor, counter: shared-counter)
#show: show-remarks
#let (conjecture-counter, conjecture-box, conjecture, show-conjecture) = make-theorem-env("conjecture", "Conjecture", conjColor, counter: shared-counter)
#show: show-conjecture
#let (axiom-counter, axiom-box, axiom, show-axiom) = make-theorem-env("axiom", "Axiom", othColor, counter: shared-counter)
#show: show-axiom
#let (example-counter, example-box, example, show-example) = make-theorem-env("example", "Example", othColor, counter: shared-counter)
#show: show-example
#let (counterexample-counter, counterexample-box, counterexample, show-counterexample) = make-theorem-env("counterexample", "Counterexample", othColor, counter: shared-counter)
#show: show-counterexample
#let (nonexample-counter, nonexample-box, nonexample, show-nonexample) = make-theorem-env("nonexample", "Nonexample", othColor, counter: shared-counter)
#show: show-nonexample
#let (convention-counter, convention-box, convention, show-convention) = make-theorem-env("convention", "Convention", othColor, counter: shared-counter)
#show: show-convention
#let (oldtag-counter, oldtag-box, oldtag, show-oldtag) = make-theorem-env("oldtag", "Old Tag", oldtagColor, counter: shared-counter)
#show: show-oldtag
#let (gap-counter, gap-box, gap, show-gap) = make-theorem-env("gap", "Gap", gapColor, counter: shared-counter)
#show: show-gap
#let (motivation-counter, motivation-box, motivation, show-motivation) = make-theorem-env("motivation", "Motivation", motivationColor, counter: shared-counter)
#show: show-motivation
#let (explanation-counter, explanation-box, explanation, show-explanation) = make-theorem-env("explanation", "Explanation", explanationColor, counter: shared-counter)
#show: show-explanation
#let (proposition-counter, proposition-box, proposition, show-proposition) = make-theorem-env("proposition", "Proposition", thmColor, counter: shared-counter)
#show: show-proposition

// Helper function for two-color theorem environments
#let make-theorem-env-two-colors(name, supplement, color1, color2, counter: none) = {
  let (counter, box, theorem, show-theorem) = make-frame(
    name,
    supplement,
    counter: counter,
    inherited-levels: 3,
    inherited-from: heading,
    render: (prefix: none, title: "", full-title: auto, body) => {
      let title-content = if title != none and title != "" {
        [#full-title: #title]
      } else {
        full-title
      }
      let frame_paint = gradient.linear(color1, color2)
      block(
        width: 100%,
        breakable: true,
        inset: 0pt,
        radius: 0pt,
        stroke: (paint: frame_paint, thickness: 1pt),
        [
          #block(
            width: 100%,
            fill: frame_paint,
            inset: (x: 8pt, y: 5pt),
            radius: 0pt,
            [
              #text(font: "Alegreya Sans SC", weight: "bold", fill: white)[
                #title-content
              ]
              #h(1fr)
              #text(fill: white)[#sym.space$triangle$]
            ]
          ),
          #block(
            width: 100%,
            fill: backgroundColor,
            inset: 8pt,
            radius: 0pt,
            body
          )
        ]
      )
    }
  )
  // Return the created functions and counters
  (counter, box, theorem, show-theorem)
}

#let (theorem-definition-counter, theorem-definition-box, theorem-definition, show-theorem-definition) = make-theorem-env-two-colors("theorem-definition", "Theorem-Definition", thmColor, defColor, counter: shared-counter)
#show: show-theorem-definition
#let (proposition-definition-counter, proposition-definition-box, proposition-definition, show-proposition-definition) = make-theorem-env-two-colors("proposition-definition", "Proposition-Definition", thmColor, defColor, counter: shared-counter)
#show: show-proposition-definition
#let (corollary-definition-counter, corollary-definition-box, corollary-definition, show-corollary-definition) = make-theorem-env-two-colors("corollary-definition", "Corollary-Definition", corColor, defColor, counter: shared-counter)
#show: show-corollary-definition

// Construction
#let (construction-counter, construction-box, construction, show-construction) = make-theorem-env(
  "construction",
  "Construction",
  conColor,
  counter: shared-counter
)
#show: show-construction

// Helper function for warning environment
#let make-warning-env(name, supplement, color, counter: none) = {
  let (counter, box, theorem, show-theorem) = make-frame(
    name,
    supplement,
    counter: counter,
    inherited-levels: 3,
    inherited-from: heading,
    render: (prefix: none, title: "", full-title: auto, body) => {
      let title-content = if title != none and title != "" {
        [#full-title: #title]
      } else {
        full-title
      }
      block(
        width: 100%,
        breakable: true,
        inset: 0pt,
        radius: 0pt,
        stroke: (paint: color, thickness: 1pt),
        [
          // Background menacing characters
          place(left, top, dx: -10pt, dy: 20pt, text(fill: rgb("D3D3D3"), size: 3em)[ゴ]),
          place(left, top, dx: 20pt, dy: 40pt, text(fill: rgb("D3D3D3"), size: 3em)[ゴ]),
          place(right, bottom, dx: 10pt, dy: -20pt, text(fill: rgb("D3D3D3"), size: 3em)[ゴ]),
          place(right, bottom, dx: -20pt, dy: -40pt, text(fill: rgb("D3D3D3"), size: 3em)[ゴ]),
          block(
            width: 100%,
            fill: color,
            inset: (x: 8pt, y: 5pt),
            radius: 0pt,
            [
              #text(font: "Alegreya Sans SC", weight: "bold", fill: white)[
                #title-content
              ]
              #h(1fr)
              #text(fill: white)[#sym.space$triangle$]
            ]
          ),
          #block(
            width: 100%,
            fill: backgroundColor,
            inset: 8pt,
            radius: 0pt,
            body
          )
        ]
      )
    }
  )
  // Return the created functions and counters
  (counter, box, theorem, show-theorem)
}

// Warning
#let (warning-counter, warning-box, warning, show-warning) = make-warning-env(
  "warning",
  "Warning",
  warColor,
  counter: shared-counter
)
#show: show-warning

// Helper function for proof environments
#let make-proof-env(name, supplement, color, qed-symbol, counter: none) = {
  let (counter, box, theorem, show-theorem) = make-frame(
    name,
    supplement,
    counter: counter,
    inherited-levels: 3,
    inherited-from: heading,
    render: (prefix: none, title: "", full-title: auto, body) => {
      let title-content = if title != none and title != "" {
        [#full-title: #title]
      } else {
        full-title
      }
      block(
        width: 100%,
        breakable: true,
        inset: 0pt,
        radius: 0pt,
        stroke: (paint: color, thickness: 1pt),
        [
          block(
            width: 100%,
            fill: color,
            inset: (x: 8pt, y: 5pt),
            radius: 0pt,
            [
              #text(font: "Alegreya Sans SC", weight: "bold", fill: white)[
                #title-content
              ]
              #h(1fr)
              #text(fill: white)[#sym.space$triangle$]
            ]
          ),
          #block(
            width: 100%,
            fill: backgroundColor,
            inset: 8pt,
            radius: 0pt,
            [
              #body
              #v(1em, weak: true)
              #align(right, qed-symbol)
            ]
          )
        ]
      )
    }
  )
  // Return the created functions and counters
  (counter, box, theorem, show-theorem)
}

#let trans-flag-qed = text(size: 1.2em)[🏳️‍⚧️]
#let prfGray = rgb("#BFBFBF")

#let (proof-counter, proof-box, proof, show-proof) = make-proof-env(
  "proof",
  "Proof",
  prfGray,
  trans-flag-qed,
  counter: shared-counter
)
#show: show-proof

#let (definition-proof-counter, definition-proof-box, definition-proof, show-definition-proof) = make-proof-env(
  "definition-proof",
  "Definition-Proof",
  prfColor,
  trans-flag-qed,
  counter: shared-counter
)
#show: show-definition-proof

#let (proof-sketch-counter, proof-sketch-box, proof-sketch, show-proof-sketch) = make-proof-env(
  "proof-sketch",
  "Proof Sketch",
  prfGray,
  trans-flag-qed,
  counter: shared-counter
)
#show: show-proof-sketch

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

= Martin-Löf Type Theory <section-martin-löf-type-theory>

== Judgements <subsection-the-judgements-of-martin-löf-type-theory>
#definition(title: "Judgements in Martin-Löf Type Theory")[
  Martin-Löf type theory has four kinds of *judgements*:
  + $A$ is a *type* in context $Gamma$.
  + $A$ and $B$ are *judgementally equal types* in context $Gamma$.
  + $a$ is a *term* of type $A$ in context $Gamma$.
  + Terms $a$ and $b$ of type $A$ are *judgementally equal terms* of type $A$ in context $Gamma$.

  These four judgements are written as follows:
  - $Gamma |- A "type"$.
  - $Gamma |- A "\u{2250}" B "type"$.
  - $Gamma |- a: A$.
  - $Gamma |- a "\u{2250}" b: A$.
]

== Formation of Contexts, Types, and Terms <subsection-formation-of-contexts-types-and-terms>
#definition(title: "Formation of Contexts, Types, and Terms in Martin-Löf Type Theory")[
  Martin-Löf type theory has the following inference rules about the formation of contexts, types, and terms.
  + *Formation of Dependent Types.* We have
    #prooftree(
      rule(
        $Gamma |- A "type"$,
        $Gamma, x: A |- B(x) "type"$,
      )
    ).
  + *Formation of Judgemental Equality of Types I.* We have
    #prooftree(
      rule(
        $Gamma |- A "type"$,
        $Gamma |- A "\u{2250}" B "type"$,
      )
    ).
  + *Formation of Judgemental Equality of Types II.* We have
    #prooftree(
      rule(
        $Gamma |- B "type"$,
        $Gamma |- A "\u{2250}" B "type"$,
      )
    ).
  + *Formation of Terms.* We have
    #prooftree(
      rule(
        $Gamma |- A "type"$,
        $Gamma |- a: A$,
      )
    ).
  + *Formation of Judgemental Equality of Terms I.* We have
    #prooftree(
      rule(
        $Gamma |- a: A$,
        $Gamma |- a "\u{2250}" b: A$,
      )
    ).
  + *Formation of Judgemental Equality of Terms II.* We have
    #prooftree(
      rule(
        $Gamma |- b: A$,
        $Gamma |- a "\u{2250}" b: A$,
      )
    ).
]

== Judgemental Equality <subsection-judgemental-equality-in-martin-löf-type-theory>
#definition(title: "Judgemental Equality in Martin-Löf Type Theory II")[
  Martin-Löf type theory has the following inference rules about judgemental equality of types, ensuring it behaves like an equivalence relation.
  + *Reflexivity.* We have
    #prooftree(
      rule(
        name: "refl",
        $Gamma |- A "\u{2250}" A "type"$,
        $Gamma |- A "type"$,
      )
    ).
  + *Symmetry.* We have
    #prooftree(
      rule(
        name: "symm",
        $Gamma |- B "\u{2250}" A "type"$,
        $Gamma |- A "\u{2250}" B "type"$,
      )
    ).
  + *Transitivity.* We have
    #prooftree(
      rule(
        name: "trans",
        $Gamma |- A "\u{2250}" C "type"$,
        $Gamma |- A "\u{2250}" B "type"$,
        $Gamma |- B "\u{2250}" C "type"$,
      )
    ).
]

#definition(title: "Inference Rules in Martin-Löf Type Theory III")[
  Martin-Löf type theory has the following inference rules about judgemental equality of terms, ensuring it behaves like an equivalence relation.
  + *Reflexivity.* We have
    #prooftree(
      rule(
        name: "refl",
        $Gamma |- a "\u{2250}" a: A$,
        $Gamma |- a: A$,
      )
    ).
  + *Symmetry.* We have
    #prooftree(
      rule(
        name: "symm",
        $Gamma |- b "\u{2250}" a: A$,
        $Gamma |- a "\u{2250}" b: A$,
      )
    ).
  + *Transitivity.* We have
    #prooftree(
      rule(
        name: "trans",
        $Gamma |- a "\u{2250}" c: A$,
        $Gamma |- a "\u{2250}" b: A$,
        $Gamma |- b "\u{2250}" c: A$,
      )
    ).
]

<more-variable-conversion-rules-for-martin-löf-type-theory>#proposition(title: "More Variable Conversion Rules for Martin-Löf Type Theory")[
  Martin-Löf type theory has the following additional variable conversion rules:
  + *Converting Terms.* We have
    #prooftree(
      rule(
        name: "CT",
        $Gamma |- a: B$,
        $Gamma |- a: A$,
        $Gamma |- A "\u{2250}" B "type"$,
      )
    ).
  + *Converting Judgemental Equality for Terms.* We have
    #prooftree(
      rule(
        name: "CJET",
        $Gamma |- a "\u{2250}" b: B$,
        $Gamma |- a "\u{2250}" b: A$,
        $Gamma |- A "\u{2250}" B "type"$,
      )
    ).
]

#proof(title: [Proof of @more-variable-conversion-rules-for-martin-löf-type-theory])[
  *Converting Terms:*
  We have
  #prooftree(
    rule(
      $Gamma |- a: B$,
      rule(
        name: "VC",
        $Gamma, x: A |- x: B$,
        rule(
          name: "G",
          $Gamma, x: B |- x: B$,
          rule(
            $Gamma |- B "type"$,
            $Gamma |- A "\u{2250}" B "type"$,
          ),
        ),
        rule(
          name: "symm",
          $Gamma |- B "\u{2250}" A "type"$,
          $Gamma |- A "\u{2250}" B "type"$,
        ),
      ),
      $Gamma |- a: A$,
    )
  ).
  This finishes the proof.

  *Converting Judgemental Equality for Terms:*
  We have
  #prooftree(
    rule(
      $Gamma |- a "\u{2250}" b: B$,
      rule(
        name: "CS2",
        $Gamma |- x[a/x] "\u{2250}" x[b/x]: B[a/x]$,
        rule(
          name: "VC",
          $Gamma, x: A |- x: B$,
          rule(
            name: "G",
            $Gamma, x: B |- x: B$,
            rule(
              $Gamma |- B "type"$,
              $Gamma |- A "\u{2250}" B "type"$,
            ),
          ),
          rule(
            name: "symm",
            $Gamma |- B "\u{2250}" A "type"$,
            $Gamma |- A "\u{2250}" B "type"$,
          ),
        ),
        $Gamma |- a "\u{2250}" b: A$,
      )
    )
  ),
  where we have used a reference (CS2) from below.
]

== Substitution <subsection-substitution-in-martin-löf-type-theory>
#definition(title: "Substitution in Martin-Löf Type Theory")[
  Martin-Löf type theory has the following inference rules about *substitution*:
  #footnote[*Further Terminology and Notation:* The type $B[a/x]$ is the *fibre* of $B$ at $a$, and is also written $B(a)$.]
  #footnote[*Further Terminology and Notation:* The term $b[a/x]$ is the *value* of $b(x)$ at $a$, and is also written $b(a)$.]
  + *Substitution in Types.* We have
    #prooftree(
      rule(
        $Gamma, Delta[a/x] |- B[a/x] "type"$,
        $Gamma |- a: A$,
        $Gamma, x: A, Delta |- B(x) "type"$,
      )
    ).
  + *Substitution in Terms.* We have
    #prooftree(
      rule(
        $Gamma, Delta[a/x] |- b[a/x]: B[a/x]$,
        $Gamma |- a: A$,
        $Gamma, x: A, Delta |- b(x): B(x)$,
      )
    ).
  + *Substitution in Judgemental Equality of Types.* We have
    #prooftree(
      rule(
        $Gamma, Delta[a/x] |- B[a/x] "\u{2250}" C[a/x] "type"$,
        $Gamma |- a: A$,
        $Gamma, x: A, Delta |- B(x) "\u{2250}" C(x) "type"$,
      )
    ).
  + *Substitution in Judgemental Equality of Terms.* We have
    #prooftree(
      rule(
        $Gamma, Delta[a/x] |- b[a/x] "\u{2250}" b'[a/x]: B[a/x]$,
        $Gamma |- a: A$,
        $Gamma, x: A, Delta |- b(x) "\u{2250}" b'(x): B(x)$,
      )
    ).

  These rules may be summarised as
  #prooftree(
    rule(
      $Gamma, Delta[a/x] |- cal(J)[a/x]$,
      $Gamma |- a: A$,
      $Gamma, x: A, Delta |- cal(J)$,
    )
  )
  for $cal(J)$ a generic judgement.
]

#definition(title: "Inference Rules in Martin-Löf Type Theory VI")[
  Martin-Löf type theory has the following additional "congruence" rules about *substitution*:
  + *Substitution by Judgementally Equal Terms I: Types.* We have
    #prooftree(
      rule(
        name: "CS1",
        $Gamma, Delta[a/x] |- C[a/x] "\u{2250}" C[b/x] "type"$,
        $Gamma |- a "\u{2250}" b: A$,
        $Gamma, x: A, Delta |- C(x) "type"$,
      )
    ).
  + *Substitution by Judgementally Equal Terms II: Terms.* We have
    #prooftree(
      rule(
        name: "CS2",
        $Gamma, Delta[a/x] |- c[a/x] "\u{2250}" c[b/x]: C[a/x]$,
        $Gamma |- a "\u{2250}" b: A$,
        $Gamma, x: A, Delta |- c(x): C(x)$,
      )
    ).
]

== Weakening <subsection-weakening-in-martin-löf-type-theory>
#definition(title: "Weakening in Martin-Löf Type Theory VII")[
  Martin-Löf type theory has the following rules about _weakening_:
  #footnote[*Further Terminology:* The type $B$ in context $Gamma, x: A$ is called the *constant family $B$* or the *trivial family $B$*.]
  + *Weakening for Types.* We have
    #prooftree(
      rule(
        $Gamma, a: A |- B(x) "type"$,
        $Gamma |- A "type"$,
        $Gamma |- B(x) "type"$,
      )
    ).
  + *Weakening for Terms.* We have
    #prooftree(
      rule(
        $Gamma, a: A |- b(x): B(x)$,
        $Gamma |- A "type"$,
        $Gamma |- b(x): B(x)$,
      )
    ).
  + *Weakening for Judgemental Equality of Types.* We have
    #prooftree(
      rule(
        $Gamma, a: A |- B(x) "\u{2250}" C(x) "type"$,
        $Gamma |- A "type"$,
        $Gamma |- B(x) "\u{2250}" C(x) "type"$,
      )
    ).
  + *Weakening for Judgemental Equality of Terms.* We have
    #prooftree(
      rule(
        $Gamma, a: A |- b(x) "\u{2250}" b'(x): B(x)$,
        $Gamma |- A "type"$,
        $Gamma |- b(x) "\u{2250}" b'(x): B(x)$,
      )
    ).

  These rules may be summarised as
  #prooftree(
    rule(
      $Gamma, a: A, Delta |- cal(J)$,
      $Gamma |- A "type"$,
      $Gamma |- cal(J)$,
    )
  )
  for $cal(J)$ a generic judgement.
]

== Generic Elements <subsection-generic-elements-in-martin-löf-type-theory>
#definition(title: "Generic Elements in Martin-Löf Type Theory")[
  Martin-Löf type theory has the following *variable rule* about the *generic element*:
  #prooftree(
    rule(
      name: "G",
      $Gamma, x: A |- x: A$,
      $Gamma |- A "type"$,
    )
  ).
]
