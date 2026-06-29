# Should I Build?

> *Stop guessing. Get a verdict.*

A multi-agent market validation skill for [Claude Code](https://claude.ai/code) and [Cursor](https://cursor.com). You describe your idea. It deploys 6 parallel research analysts - community pain, search demand, competitive landscape, market size, willingness to pay, and market timing - then verifies the contested facts and scores everything against a 7-pillar framework.

You get a **BUILD / CONDITIONAL / PIVOT / STOP** verdict. With receipts.

---

## The problem this solves

Most founders validate ideas by asking their friends, posting in a Slack group, or - worst of all - just building. By the time they realize there's no real demand, they've spent months and real money.

Real validation requires checking Reddit for genuine pain threads, auditing competitor reviews for gaps, estimating market size bottom-up, testing willingness to pay against existing tools, and cross-checking all of it. Done properly, that's a week of research. This skill does it in minutes.

---

## Example output

```
## Should I Build? - Weekly MRR Tracker for Solo Founders

**Verdict: CONDITIONAL** - 64% confidence

### Scorecard
| Pillar                 | /5 | Key Evidence                                              |
|------------------------|----|-----------------------------------------------------------|
| Problem Clarity        |  4 | r/SaaS, r/microSaaS - 40+ threads on MRR tracking pain   |
| Target Customer        |  4 | Solo founders / indie hackers, self-serve budget          |
| Demand Signal          |  3 | Baremetrics exists ($50/mo) but overkill; no lightweight  |
| Differentiation        |  3 | Gap confirmed: all tools require Stripe connection        |
| Execution Feasibility  |  4 | MVP scope < 4 weeks, no external API dependencies         |
| Distribution Readiness |  2 | No tested channel yet - r/indiehackers is plausible       |
| Monetization Viability |  3 | $9–$19/mo is credible; WTP confirmed by Baremetrics comps |
**Total: 23/35**

### Top Green Flags
1. Baremetrics charges $50/mo for features most solo founders never use - [g2.com/baremetrics reviews](https://g2.com)
2. 6 Reddit threads asking "is there a simpler MRR tracker?" in the last 90 days - [r/SaaS](https://reddit.com/r/SaaS)
3. "No Stripe required" confirmed as unmet need in 3 competitor 2-star reviews

### Top Red Flags
| Flag                                         | Severity |
|----------------------------------------------|----------|
| No tested acquisition channel yet            | HIGH     |
| Market is small ($80M TAM) - lifestyle, not venture | MEDIUM   |
| Founders often track in Notion for free      | MEDIUM   |

### Kill Condition
Painkiller test: **PASS** - paid alternatives exist ($50–$200/mo), manual workarounds active

### Recommended Next Experiment
Post a bare landing page to r/indiehackers with "free beta" offer. 
Target: 50 signups in 7 days without paid ads. If yes → build. If no → distribution is the real problem.

### Comparable Companies
- Plausible Analytics (simple GA alternative) - validated "less features, lower price" positioning
- Potion (simple Notion website builder) - same "anti-complexity" thesis, profitable

### Evidence Gaps
- Conversion rate from free → paid unknown; run a pricing page experiment
- No interview data yet on how frequently founders check MRR
```

---

## How it works

```
User describes idea
        │
Step 0  │  Orchestrator frames the idea (target, problem, solution, why now)
        │
Wave 1  ├─── Community Signal Analyst  ──── uses last30days ──── Reddit/X/HN/YouTube/TikTok
        ├─── Search Demand Analyst     ──── Google Trends, keyword CPC, SERP structure
        ├─── Competitive Intel Analyst ──── landscape map, 2-3★ review gap mining
        ├─── Market Size Analyst       ──── bottom-up TAM/SAM/SOM with methodology
        ├─── WTP & Demand Analyst      ──── paid tools, workaround cost, painkiller test
        └─── Timing & Trend Analyst    ──── "why now?", proxy companies, tarpit check
        │
Wave 2  └─── Claim Verifier  ──────────── uses deep-research ─── VERIFIED / PARTLY / FALSE
        │
Step 3  │  Orchestrator scores 7 pillars, applies kill condition, delivers verdict
```

All 6 Wave 1 agents run **in parallel**. Wall-clock time is bounded by the slowest agent, not the sum of all six.

---

## Install

One command installs all three required skills:

**macOS / Linux:**
```bash
bash <(curl -s https://raw.githubusercontent.com/Endokelp/ShouldIBuild/main/install.sh)
```

**Windows PowerShell:**
```powershell
irm https://raw.githubusercontent.com/Endokelp/ShouldIBuild/main/install.ps1 | iex
```

**Manual (or if you prefer individual control):**
```bash
npx skills add Endokelp/ShouldIBuild --skill should-i-build -g -y
npx skills add mvanhorn/last30days-skill --skill last30days -g -y
npx skills add 199-biotechnologies/claude-deep-research-skill --skill deep-research -g -y
```

**Verify:**
```bash
npx skills list
# should show: should-i-build, last30days, deep-research
```

---

## Prerequisites

| Skill | Required | Notes |
|---|---|---|
| `should-i-build` | Yes | This repo |
| `last30days` | Yes | No key required. Set `SCRAPECREATORS_API_KEY` for richer Reddit/X/YouTube/TikTok signal. |
| `deep-research` | Yes | No key required. |

---

## Usage

```
should i build this: [describe your idea in 1–3 sentences]
```

```
/sib [describe your idea]
```

```
/sib quick [describe your idea]    ← 3 analysts, no claim verification, faster
```

**Be specific.** The more precisely you describe your target customer and the problem you're solving, the sharper the research. Vague inputs produce vague verdicts.

**Good:**
```
/sib A browser extension that auto-fills LinkedIn job applications using your resume -
targeting developers in FAANG job search mode who apply to 30+ jobs per week.
```

**Too vague:**
```
/sib an AI tool for job seekers
```

---

## Verdict scale

| Score | Verdict | What to do |
|---|---|---|
| 30–35 | **BUILD** | Ship the smallest possible version this week. |
| 22–29 | **CONDITIONAL** | One or two pillars are weak. The report names exactly which gap to close and how. Run that experiment first. |
| 15–21 | **PIVOT** | The problem may be real; the approach, ICP, or pricing is wrong. Adjust one variable and re-run. |
| < 15 | **STOP** | Fundamental demand failure. "Stop" is a win - it just saved you months. |

### The kill condition

If the **Demand Signal** pillar scores 0 or 1 - meaning no evidence of anyone paying for any partial solution - the verdict is automatically **STOP**, regardless of total score.

A beautiful product in a vitamin market is still a vitamin.

---

## Companion skill roles

| Skill | Role in this pipeline | Why it's bounded here |
|---|---|---|
| `last30days` | Community Signal Analyst - pulls fresh 30-day cross-platform social signal | Multi-platform (Reddit + X + HN + YouTube + TikTok) in one call; reserved to avoid duplication |
| `deep-research` | Claim Verifier - Quick mode on 3–5 contested claims before scoring | Prevents verdict from being built on hallucinated market numbers |

Both skills have single, bounded roles. They are never cross-used - calling `last30days` inside the Search Demand analyst or `deep-research` inside Wave 1 would cause token explosion with no added signal quality.

---

## Methodology

The 7-pillar scoring framework and signal taxonomy are grounded in:

- **YC Startup School** (Jared Friedman, Michael Seibel, Paul Graham) - problem urgency, founder-market fit, tarpit idea detection
- **Steve Blank's Customer Development** - earlyvangelist profile, the four-stage validation loop
- **Rob Fitzpatrick's The Mom Test** - painkiller vs. vitamin test, commitment hierarchy
- **Sean Ellis's PMF framework** - the 40% rule, segment-level demand testing
- **Jobs-to-be-Done (Christensen / Ulwick)** - the Four Forces model, opportunity scoring

The skill operationalizes these frameworks as agent mandates - each analyst is looking for the specific behavioral signals (not opinions) these methodologies prescribe.

---

## Files

```
ShouldIBuild/
├── should-i-build/
│   ├── SKILL.md      ← orchestration procedure, triggers, wave checklist
│   ├── AGENTS.md     ← mandates for all 6 analysts + Claim Verifier
│   └── VERDICT.md    ← 7-pillar scoring rubric, decision thresholds, flag taxonomy
├── install.sh        ← installs all 3 skills (Unix)
├── install.ps1       ← installs all 3 skills (Windows)
├── skills-lock.json  ← for npx skills experimental_install
└── README.md
```

---

## Related skills

- [DecisionCouncil](https://github.com/Endokelp/DecisionCouncil) - adversarial debate for high-stakes decisions. Use the council once you've validated demand and need to choose between implementation paths.
- [last30days](https://github.com/mvanhorn/last30days-skill) - standalone social signal research across Reddit, X, HN, YouTube, TikTok
- [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill) - deep claim verification

---

## Credits

- Companion skills: [last30days](https://github.com/mvanhorn/last30days-skill) by [@mvanhorn](https://github.com/mvanhorn), [deep-research](https://github.com/199-biotechnologies/claude-deep-research-skill) by [@199-biotechnologies](https://github.com/199-biotechnologies)
- Council skill pattern: [DecisionCouncil](https://github.com/Endokelp/DecisionCouncil)
- Validation methodology: YC, Steve Blank, Rob Fitzpatrick, Sean Ellis, Clayton Christensen

---

*Built on the Everything Claude Code skill pattern. Token-efficient by design: SKILL.md loads on trigger, AGENTS.md is read once by the orchestrator (not by agents), VERDICT.md is read only at synthesis.*
