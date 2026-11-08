---
paths: ["**/*.{ts,tsx,mts,cts}"]
---
# TypeScript

- Strict types. `unknown` + narrowing instead of `any`; no `!` or `as` casts without a stated reason.
- Model states as discriminated unions; exhaustive `switch` ending in a `never` check.
- Parse untrusted data at the boundary into typed values (use the repo's validator, e.g. zod); trust types inside.
- Plain functions and modules before classes. `const`, `readonly`, `as const`; literal unions over `enum` unless the repo uses enums.
- Expected failures: typed result/union. Bugs: throw. Every promise is awaited or explicitly handled.
- Small public surface: export only what callers need; no barrel-file import cycles.
- Exemplars: zod (types derived from one source of truth), VS Code (layered services, disposables).
- Verify: the repo's `tsc --noEmit`, lint and test scripts.
