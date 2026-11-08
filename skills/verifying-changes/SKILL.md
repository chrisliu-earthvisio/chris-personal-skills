---
name: verifying-changes
description: Defines what "done" means for a code change and proves it with tangible evidence. Use when starting non-trivial work (to agree on the finish line) and after editing code, before committing, opening a PR or reporting success.
---

# Verifying changes

Scale rigor to risk. A small change you are confident in needs only the cheap checks. New behavior, shared code, data, auth, or anything hard to undo gets the full loop.

## Before: define done
- State the finish line as evidence anyone can check: a named test passing, command output, a screenshot, a log or trace line. "Looks done" is not a finish line.
- If done is ambiguous, or judging it needs the user (UX, product trade-off, accepting a risk), propose a criterion and ask before building.

## After: produce the evidence
1. Find the project's real commands: CI config, package scripts, Makefile, pyproject.toml, Gradle, Package.swift, project CLAUDE.md.
2. Run narrow to wide: format/lint → typecheck/compile → touched tests → full suite if affordable or shared code changed.
3. Exercise the behavior for real (CLI, endpoint, UI path) and capture the agreed evidence.
4. Prove guarding tests can fail: confirm each went red before the fix, or briefly break the code and watch it fail, then restore.
5. Review `git diff`: remove debug output, dead code, unrelated edits and comments that restate code.
6. On failure, fix the root cause and repeat. Never skip, weaken or delete a test, or add ignores, to get green.

## Question green
When it matters, ask what a passing check proved and what it did not (tests pass but the migration never ran; types check but the endpoint was never hit). Close the gap or report it.

## Report
Lead with the evidence: test names, command and key output, screenshot or log path. Then state what was not verified and any decision the user owns. If the evidence can't be produced, say the work is not done. An unproven "done" is worse than an honest "not done".
