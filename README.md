## Fact Interchange Grammar

Object Role Modelling (ORM, but not Object Relational Mapping!) is a fact-based approach to information modelling.

The [ORM Syntax and Semantics](http://github.com/cjheath/orm-syntax-and-semantics-docs)
uses FIG to translate between graphical ORM diagram notation and this text-based form,
for which the Semantics provides a formal logic definition as Well Formed Formulae (WFFs).

This implementation in C++ makes use of the [Px](http://github.com/cjheath/px) PEG grammar
description language and parser generator, and the [STRPP](http://github.com/cjheath/strpp)
support library for Unicode strings, arrays, maps, and variant types, amongst other things.

Px also generates browsable rail-road diagrams that use SVG in a web page.

### To Build

Check out this repository alongside checkouts of STRPP and Px, and say "make".

### Testing

Px grammars use PEG, which does not require separate tokenisation, hence whitespace must be
explicitly included in the grammar. To ensure that this has been done everywhere necessary,
the two files examples/minspace.fig and examples/maxspace.fig are provided. These contain
one instance of every grammatical construct allowed, with all possible space elided, and
with all possible single spaces included.
