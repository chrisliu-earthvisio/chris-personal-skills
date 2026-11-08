# Engineering defaults

- Comments: only what code can't say (why, invariants, units, gotchas). Terse. Never restate code, narrate edits, or mention the task/PR.
- Fit in: read neighboring code first; match its patterns, names, error handling and test style. Smallest coherent diff; no drive-by refactors or new dependencies without need.
- Least power: pick the simplest construct that works (function > class > inheritance; immutable > mutable; return value > callback).
- Design, API or refactor work → `designing-software` skill. Adding/changing tests → `writing-tests` skill.
- Done means verified: run the `verifying-changes` loop before claiming success; say what was not verified.
