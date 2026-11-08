---
name: designing-software
description: Design principles for module boundaries, interfaces, data types, error handling, naming and comments, drawn from A Philosophy of Software Design and the Principle of Least Power. Use when designing a feature, API or module, refactoring, or reviewing a diff for maintainability.
---

# Designing software

Goal: minimize complexity — cognitive load, change amplification, unknown unknowns. Work strategically: leave touched code a little better designed, not just working.

## Fit the codebase
- Match existing patterns, naming, layering and error style; consistency beats local preference. Diverge only when the pattern is itself the defect, and say so.
- Reuse existing helpers before writing new ones. Prefer the smallest change that solves the problem properly.

## Modules
- Deep modules: small interface, substantial hidden implementation. Red flags: pass-through methods, thin wrappers, classes that only shuttle data.
- Hide each design decision in one place. Red flags: two modules that must change together (leakage); code split by execution order rather than knowledge (temporal decomposition).
- Pull complexity down: the implementer absorbs it so callers don't. Make the common case one obvious call with sane defaults (requests: `requests.get(url)`).
- Somewhat general interfaces are simpler than special-cased ones. Keep special cases out of general modules.
- Each layer offers a different abstraction (LLVM: frontends → IR → passes → backends, each a library with a narrow contract). Adjacent layers with the same abstraction should merge.
- Define errors out of existence first (idempotent delete, clamped ranges); then handle the rest at one boundary.
- Design it twice: for any non-trivial interface, sketch two options and choose the simpler interface.

## Least power
Choose the least powerful option that works:
- State: immutable values > mutation confined to one function > shared mutable state. Never a mutable reference to a mutable collection.
- Published API: function on standard types > function on own types > caller instantiates a class > caller subclasses.
- Data: primitives/collections/optional > plain function > record > closed sum type > open class hierarchy.
- Errors: optional for one failure mode > result/sealed type for known failures > exceptions for unexpected ones, caught at coarse boundaries. No error flags.
- Async: plain return > future/async > callbacks.
- Dependencies: hard-code > parameter > constructor injection > framework/global. Pass the field used, not the whole object.

## Names and comments
- Names are precise and consistent. If a good name is hard to find, the design is unclear.
- Comments state what code can't: why, invariants, units, contracts. Interface comments say what, not how.

## Red flags in review
Shallow module, leakage, pass-through, special-general mixture, vague name, hard-to-describe interface, nonobvious code, duplicated logic.
