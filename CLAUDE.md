# Engineering defaults

- Comments: only what code can't say (why, invariants, units, gotchas). Terse. Never restate code, narrate edits, or mention the task/PR.
- Fit in: read neighboring code first; match its patterns, names, error handling and test style. Smallest coherent diff; no drive-by refactors or new dependencies without need.
- Least power: pick the simplest construct that works (function > class > inheritance; immutable > mutable; return value > callback).
- Design, API or refactor work → `designing-software` skill. Adding/changing tests → `writing-tests` skill.
- Done means evidence: for non-trivial work, fix a tangible finish line up front (passing test, output, screenshot, log), asking the user if it's ambiguous; finish with that evidence plus what it does not prove (`verifying-changes`).
- Scale rigor to risk, and bring the user in at decisions they own: they maintain this code.
