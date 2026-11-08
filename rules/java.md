---
paths: ["**/*.java"]
---
# Java (Effective Java)

- Minimize accessibility and mutability: `private final` fields, `final` classes, defensive copies, immutable collections.
- Records for data; sealed interfaces + pattern-matching `switch` for closed variants.
- Static factories, or builders for many parameters, over telescoping constructors.
- Composition over inheritance; design for inheritance or prohibit it. Interfaces define types, not constants.
- Generics: no raw types; bounded wildcards (PECS); fix unchecked warnings instead of suppressing broadly.
- `Optional` for return values only; return empty collections, never null. Enums + `EnumMap`/`EnumSet` over int constants/bit fields.
- Exceptions: only for exceptional conditions; standard types; translate to the caller's abstraction; never swallow. try-with-resources.
- `equals`/`hashCode` together and per contract. Validate parameters early.
- Exemplars: Guava (immutable collections, preconditions), OkHttp (small, layered API).
- Verify: the repo's `./gradlew check` or `mvn verify`.
