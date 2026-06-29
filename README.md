# Should I Build?

A multi-agent market validation skill for [Claude Code](https://claude.ai/code) and [Cursor](https://cursor.com). Orchestrates 6 parallel research analysts and delivers a clear **BUILD / CONDITIONAL / PIVOT / STOP** verdict with a 7-pillar scorecard — before you write a single line of code.

Companion to [DecisionCouncil](https://github.com/Endokelp/DecisionCouncil). Where the council helps you choose between options, this skill validates whether any option should exist at all.

## What it does

1. **Frames** the idea (target customer, problem, solution, why now)
2. **Spawns 6 parallel analysts** covering community signal, search demand, competitive landscape, market size, willingness to pay, and market timing
3. **Runs a Claim Verifier** on contested facts using `deep-research`
4. **Scores 7 validation pillars** (each 0–5, max 35)
5. **Delivers a verdict** with green flags, red flags, kill condition check, comparable companies, and a specific next experiment

## Install (all 3 skills at once)

**Unix / macOS / Linux:**
```bash
bash <(curl -s https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/ShouldIBuild/main/install.sh)
```

**Windows PowerShell:**
```powershell
irm https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/ShouldIBuild/main/install.ps1 | iex
```

**Manual:**
```bash
npx skills add YOUR_GITHUB_USERNAME/ShouldIBuild --skill should-i-build -g -y
npx skills add mvanhorn/last30days-skill --skill last30days -g -y
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y
```

**From repo clone (experimental):**
```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/ShouldIBuild
cd ShouldIBuild
npx skills experimental_install
```

## Prerequisites

| Skill | Required | API Key |
|---|---|---|
| `should-i-build` | Yes | None |
| `last30days` | Yes | `SCRAPECREATORS_API_KEY` (optional but improves signal quality) |
| `deep-research` | Yes | None |

Setting `SCRAPECREATORS_API_KEY` unlocks richer Reddit, X, YouTube, and TikTok coverage in the Community Signal Analyst step. The skill works without it but with reduced social signal depth.

## Usage

```
should i build this: [describe your idea in one paragraph]

/sib [describe your idea]

/sib quick [describe your idea]   ← faster, 3 analysts, no claim verification
```

**Example:**
```
should i build this: A tool that helps solo founders track their weekly recurring revenue
without connecting to Stripe — they just paste a number each week and it plots the trend,
computes growth rate, and emails a weekly summary.
```

## Verdict scale

| Score | Verdict | Meaning |
|---|---|---|
| 30–35 | BUILD | All pillars validated. Ship the smallest possible MVP. |
| 22–29 | CONDITIONAL | 1–2 weak pillars. Run a 2–4 week targeted experiment first. |
| 15–21 | PIVOT | Core problem may be real; approach or ICP needs adjustment. |
| < 15 | STOP | Fundamental gap. Saves months of misdirected effort. |

**Kill condition:** If the Demand Signal pillar scores 0–1, the verdict is automatically STOP regardless of total. No other pillar compensates for a vitamin market.

## Companion skills & their roles

| Skill | Used by | Why |
|---|---|---|
| `last30days` | Community Signal Analyst (Wave 1) | Pulls fresh 30-day Reddit/X/HN/YouTube/TikTok signal — multi-platform in one call |
| `deep-research` | Claim Verifier (Wave 2) | Verifies contested market size, competitor dominance, and community heat claims before scoring |

Both companion skills have single, bounded roles. They are never cross-used to avoid token explosion.

## Files

```
should-i-build/
├── SKILL.md     — orchestration procedure and wave checklist
├── AGENTS.md    — mandates for all 6 analysts + Claim Verifier
└── VERDICT.md   — 7-pillar scoring rubric and decision thresholds
```

## Credits

- Methodology: YC Startup School, Steve Blank Customer Development, Rob Fitzpatrick (The Mom Test), Sean Ellis PMF framework, Clayton Christensen / JTBD
- Companion skills: [last30days](https://github.com/mvanhorn/last30days-skill) by mvanhorn, [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill) by 199-biotechnologies
- Council skill pattern: [DecisionCouncil](https://github.com/Endokelp/DecisionCouncil)
