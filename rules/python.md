---
paths: ["**/*.py", "**/*.pyi"]
---
# Python

- Type hints on public functions; keep the repo's checker (mypy/pyright) clean.
- Data: frozen `dataclass`/`NamedTuple` over loose dicts; `Enum`/`Literal` for closed sets.
- Functions and modules before classes; no Java-style getters/setters; `@property` only for cheap derived values.
- Catch narrow exceptions; never bare `except`; `raise ... from err`. Context managers for resources. No mutable default args.
- APIs in the style of requests/Flask: the common case is one obvious call with sensible defaults; power via optional objects (e.g. `Session`) or extensions.
- pytest: plain `assert`, fixtures, `parametrize`, `tmp_path`; `monkeypatch` only at real boundaries.
- Verify: the repo's ruff/formatter, type checker, then `pytest`.
