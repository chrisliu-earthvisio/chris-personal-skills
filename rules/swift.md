---
paths: ["**/*.swift"]
---
# Swift

- Value types (`struct`/`enum`) by default; `class` only for identity or shared state, `final` unless designed for subclassing.
- `let` over `var`. Enums with associated values for state; exhaustive `switch` without `default` where possible.
- Protocols only with two or more conformers or a real test seam; keep them small.
- Errors: `Optional` for simple absence, `throws` with typed errors for known failures. No `!`/`try!` outside tests and provable invariants.
- Concurrency: async/await, actors for shared mutable state, `@MainActor` for UI, `Sendable` types across tasks.
- Access control: `private`/`internal` by default; minimal `public`.
- Exemplars: swift-argument-parser (declarative API), swift-collections (value semantics).
- Verify: `swift build`/`swift test` or the project's xcodebuild test scheme; swiftlint if configured.
