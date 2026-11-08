---
name: verifying-changes
description: Verification loop to run after implementing a code change and before committing, opening a PR or reporting success. Use whenever code was edited.
---

# Verifying changes

1. Find the project's real commands: CI config, package.json scripts, Makefile, pyproject.toml, Gradle, Package.swift, project CLAUDE.md. Never guess when they exist.
2. Run narrow to wide: format/lint → typecheck/compile → tests for touched modules → full suite if affordable or shared code changed.
3. Exercise observable behavior for real (CLI, endpoint, UI path). Passing tests are not proof the feature works.
4. Review `git diff`: remove debug output, dead code, unrelated edits and comments that restate code; check it reads like the surrounding code.
5. On failure, fix the root cause and repeat from step 2. Never skip, weaken or delete a test, or add ignores, to get green.
6. Report what ran, the results, and anything not verified.
