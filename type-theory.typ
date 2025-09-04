#import "preamble.typ"
#let title = [Type Theory]
#set text(font: "Alegreya Sans")
#set heading(numbering: "1.")

#align(center, text(17pt)[*#title*])
#align(center, text(12pt)[#preamble.author])
#align(center, text(12pt)[#preamble.date.display("[month repr:long] [day padding:none], [year]")])

This chapter contains material on type theory.

#outline()

= Type Theory Basics <section-type-theory-basics>
== Inference Rules <subsection-inference-rules>
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
