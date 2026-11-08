# chris-personal-skills

Minimal, context-cheap engineering defaults for Claude Code.

| Piece | Loaded | Purpose |
|---|---|---|
| `CLAUDE.md` | every session (~100 words) | comment policy, fit-in, least power, pointers to skills |
| `skills/designing-software` | on demand | Ousterhout (APoSD) + Li Haoyi's Principle of Least Power + LLVM/requests exemplars |
| `skills/writing-tests` | on demand | positive-value tests only; no change detectors |
| `skills/verifying-changes` | on demand | lint → typecheck → tests → real run → diff review loop |
| `rules/<lang>.md` | only when a matching file is touched | TypeScript, Python, Swift, Java (Effective Java), Kotlin |

Install or repair (idempotent):

```sh
curl -fsSL https://raw.githubusercontent.com/chrisliu-earthvisio/chris-personal-skills/main/install.sh | sh
```

A SessionStart hook fast-forwards the clone at `~/.claude/chris-personal-skills`, so edits land in the next session. Re-run `install.sh` after adding a new skill or rule file.

Sources: [A Philosophy of Software Design skills](https://github.com/markduan/a-philosophy-of-software-design-skills), [Principle of Least Power](https://www.lihaoyi.com/post/StrategicScalaStylePrincipleofLeastPower.html), [Principles of Automated Testing](https://www.lihaoyi.com/post/PrinciplesofAutomatedTesting.html), [How SQLite Is Tested](https://www.sqlite.org/testing.html), [effective-java-core](https://github.com/sherman/codex-skills/blob/master/skills/effective-java-core/SKILL.md).
