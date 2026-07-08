# Should I Build?

Markdown skill package for Claude Code and Cursor. No app runtime — agents follow the skill files under `should-i-build/`.

## Agent role

You are editing an installable agent skill, not an application. Prefer the smallest change that keeps install, triggers, and the verdict pipeline correct.

## Tech stack

- Markdown skill files (`SKILL.md`, `AGENTS.md`, `VERDICT.md`)
- Shell installers: `install.sh` (bash), `install.ps1` (PowerShell)
- Distribution via `npx skills` and `skills-lock.json`
- No application language, package manager, or build step

## Layout

- `should-i-build/SKILL.md` — orchestration, triggers, output contract
- `should-i-build/AGENTS.md` — Wave 1/2 analyst mandates (paste verbatim into Tasks)
- `should-i-build/VERDICT.md` — 7-pillar scoring rubric
- `install.sh` / `install.ps1` — install this skill + `last30days` + `deep-research`
- `skills-lock.json` — `npx skills` lockfile

## Install

```bash
npx skills add Endokelp/Should-I-build --skill should-i-build -g -y
```

## Domain terms

- **BUILD / CONDITIONAL / PIVOT / STOP** — verdict labels from `should-i-build/VERDICT.md`
- **Wave 1** — six parallel research analysts
- **Claim Verifier** — Wave 2 fact-check via `deep-research`
- **Painkiller vs vitamin** — paid demand vs complaints-only

## When editing

- Keep diffs minimal. Prefer editing existing skill files over new abstractions.
- Repo URLs must use `Endokelp/Should-I-build` (hyphenated), not `ShouldIBuild`.
- Do not invent market numbers in skill docs — use `INSUFFICIENT_DATA` patterns already defined.
- Companion skill roles stay bounded: `last30days` → Community Signal only; `deep-research` → Claim Verifier only.
- *Do not commit secrets or API keys; optional `SCRAPECREATORS_API_KEY` stays in the user environment only.*
