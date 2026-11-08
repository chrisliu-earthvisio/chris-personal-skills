import json, os, sys

path = sys.argv[1]
settings = json.load(open(path)) if os.path.exists(path) else {}
settings["autoMemoryEnabled"] = True
settings["outputStyle"] = "Concise"

# Background fast-forward so edits pushed to the repo reach the next session.
pull = "git -C ~/.claude/chris-personal-skills pull --ff-only -q >/dev/null 2>&1 &"
groups = settings.setdefault("hooks", {}).setdefault("SessionStart", [])
if not any(h.get("command") == pull for g in groups for h in g.get("hooks", [])):
    groups.append({"hooks": [{"type": "command", "command": pull}]})

with open(path, "w") as f:
    json.dump(settings, f, indent=2)
    f.write("\n")
