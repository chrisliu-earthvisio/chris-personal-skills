#!/bin/sh
# Idempotent. Links skills and rules into ~/.claude, imports CLAUDE.md, merges settings.
set -eu
DEST="$HOME/.claude/chris-personal-skills"
[ -d "$DEST/.git" ] || git clone -q https://github.com/chrisliu-earthvisio/chris-personal-skills.git "$DEST"
mkdir -p "$HOME/.claude/skills" "$HOME/.claude/rules"
for s in "$DEST"/skills/*/; do s=${s%/}; ln -sfn "$s" "$HOME/.claude/skills/$(basename "$s")"; done
for r in "$DEST"/rules/*.md; do ln -sfn "$r" "$HOME/.claude/rules/chris-$(basename "$r")"; done
IMPORT="@~/.claude/chris-personal-skills/CLAUDE.md"
touch "$HOME/.claude/CLAUDE.md"
grep -qxF "$IMPORT" "$HOME/.claude/CLAUDE.md" || printf '%s\n' "$IMPORT" >> "$HOME/.claude/CLAUDE.md"
python3 "$DEST/scripts/merge_settings.py" "$HOME/.claude/settings.json"
echo "Installed. New files in skills/ or rules/ need a re-run of install.sh."
