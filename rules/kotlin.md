---
paths: ["**/*.kt", "**/*.kts"]
---
# Kotlin

- `val` and read-only collections by default; `data class` for values; sealed interfaces + exhaustive `when` for variants.
- Null safety is the design: no `!!` outside tests; nullable return for simple absence, sealed result for known failures, exceptions for bugs.
- Top-level functions before classes; extension functions only when they read naturally; avoid nested scope-function chains.
- `internal`/`private` by default. Constructor injection over service locators.
- Coroutines: structured concurrency (no `GlobalScope`), inject dispatchers, `Flow` for streams, respect cancellation.
- Effective Java still applies: minimize mutability, composition over inheritance.
- Exemplars: Okio/OkHttp (small deep APIs), kotlinx.coroutines.
- Verify: the repo's `./gradlew check` (ktlint/detekt if configured).
