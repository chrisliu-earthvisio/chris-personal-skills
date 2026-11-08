---
name: writing-tests
description: Decides which tests are worth writing and how to write them so each one adds lasting value and fits the existing suite. Use when adding or changing tests, fixing a bug, or deciding whether a change needs tests.
---

# Writing tests

Each test has a permanent cost: runtime, flakiness, and edits on every refactor. Add one only if it would catch a plausible regression someone cares about.

## Before writing
- Read the existing suite. Extend its files, fixtures, helpers and naming. No new framework, mocking library or style.
- Prefer one more case in an existing table/parametrized test over a new test.

## Write
- Bug fix: a test that fails before the fix and passes after (SQLite: not fixed until reproduced).
- New behavior: test the public contract at the highest level that stays fast and deterministic.
- Where bugs live: boundaries (empty, one, max, off-by-one), malformed input, error and cleanup paths, glue between components (DB, IPC, serialization).
- Large input spaces (parsers, algorithms): property or fuzz tests of invariants; pin minimized failures as example cases.
- Invariants that must always hold: assert them in production code, not only in tests.

## Don't write
- Change detectors: asserting mock call sequences, private methods, exact log text, or large snapshots nobody reads.
- Tests of trivial accessors, constants, or language/framework behavior.
- Mocks of fast code you own: use the real thing or a fake. Mock only slow or nondeterministic boundaries (network, clock, randomness).
- Near-duplicates that always fail together.

Litmus: a behavior-preserving refactor breaks zero tests; a real bug breaks at least one. A test you never saw fail is unproven: confirm it goes red when the behavior breaks.

## Shape
- One behavior per test; the name states it. Plain asserts with clear failure output.
- Deterministic: inject clock, seed and IDs; no sleeps.
- Keep each test's inputs and expected outputs visible; factor out setup, not assertions.
