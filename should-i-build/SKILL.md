---
name: should-i-build
description: >-
  Multi-agent market validation skill. Spawns 6 parallel research analysts (Community
  uses last30days for fresh 30-day signal; Claim Verifier uses deep-research for
  fact-checking) and delivers a BUILD / CONDITIONAL / PIVOT / STOP verdict with a
  7-pillar scorecard. Use when user says "should I build this", "/sib", "validate
  my idea", "is there demand for", "market validate", "vibe check my idea", or
  "do a should-i-build on this". Not for technical feasibility — demand only.
disable-model-invocation: true
homepage: https://github.com/Endokelp/Should-I-build
repository: https://github.com/Endokelp/Should-I-build
---

# Should I Build?

Evidence-bound market validation. 6 parallel analysts → Claim Verifier → scored verdict.

**Companion skills (required):** [`last30days`](https://github.com/mvanhorn/last30days-skill) · [`deep-research`](https://github.com/199-biotechnologies/claude-deep-research-skill)

**Companion skill roles:** `last30days` → Community Signal Analyst only. `deep-research` → Claim Verifier only. Never cross-use.

## Triggers

| Phrase | Mode |
|---|---|
| `should i build this: …` | Standard |
| `/sib …` | Standard |
| `/sib quick …` | Quick |
| `validate my idea: …` | Standard |
| `is there demand for …` | Standard |
| `vibe check my idea` | Standard |

## Step 0 — Frame (inline, before any Task)

Extract from user input. If missing, ask. ≤ 5 bullets:
- **Idea**: one sentence
- **Target customer**: job title / situation
- **Problem solved**: pain, frequency, severity
- **Proposed solution**: the mechanic
- **Why now** (optional): recent change enabling this

Paste this frame verbatim into every Task prompt below.

## Step 1 — Wave 1: 6 Parallel Analysts

Read [AGENTS.md](AGENTS.md) now. Copy each agent's mandate block verbatim into its Task prompt — do not summarize or paraphrase.

Spawn all 6 in **one message** with `run_in_background: false`, `subagent_type: generalPurpose`:

```
Task(description="SIB Community Analyst",    subagent_type="generalPurpose", run_in_background=false, prompt="...")
Task(description="SIB Search Demand",        subagent_type="generalPurpose", run_in_background=false, prompt="...")
Task(description="SIB Competitive Intel",    subagent_type="generalPurpose", run_in_background=false, prompt="...")
Task(description="SIB Market Size",          subagent_type="generalPurpose", run_in_background=false, prompt="...")
Task(description="SIB WTP Analyst",          subagent_type="generalPurpose", run_in_background=false, prompt="...")
Task(description="SIB Timing Analyst",       subagent_type="generalPurpose", run_in_background=false, prompt="...")
```

Each prompt = Step 0 frame + agent mandate from AGENTS.md. Cap: ≤ 600 words body + structured output block.

## Step 2 — Wave 2: Claim Verifier

After Wave 1 completes, compile 3–5 contested or high-stakes claims (e.g., market size figures, competitor dominance assertions, community heat scores). Spawn one agent:

```
Task(description="SIB Claim Verifier", subagent_type="generalPurpose", run_in_background=false, prompt="...")
```

Prompt = Step 0 frame + claim list + Claim Verifier mandate from AGENTS.md. Cap: ≤ 700 words.

## Step 3 — Synthesize (inline, no extra agent)

Read [VERDICT.md](VERDICT.md) for the 7-pillar scoring rubric and decision thresholds.

Score using Wave 1 outputs + verified claims from Wave 2. Apply kill condition. Deliver Output Contract below.

## Output Contract

```
## Should I Build? — [Idea Name]

**Verdict: [BUILD / CONDITIONAL / PIVOT / STOP]** — [X]% confidence

### Scorecard
| Pillar | /5 | Key Evidence (with source) |
|---|---|---|
| Problem Clarity       | |  |
| Target Customer       | |  |
| Demand Signal         | |  |
| Differentiation       | |  |
| Execution Feasibility | |  |
| Distribution Readiness| |  |
| Monetization Viability| |  |
**Total: [XX]/35**

### Top Green Flags
1. [finding — source URL]
2. [finding — source URL]
3. [finding — source URL]

### Top Red Flags
| Flag | Severity |
|---|---|
| [finding] | KILL / HIGH / MEDIUM |

### Kill Condition
Painkiller test: **[PASS / FAIL]** — [one-line reasoning]

### Claim Verification
| Claim | Status |
|---|---|
| [claim] | VERIFIED / PARTLY / FALSE / UNVERIFIABLE |

### Recommended Next Experiment
[Specific, executable 1-week action targeting the biggest evidence gap]

### Comparable Companies
[1–3 proxies that validated a similar model in another geography/vertical]

### Evidence Gaps
[What remains unknown and the fastest way to close each gap]
```

## Procedure: Quick Mode (`/sib quick`)

Wave 1: Community Analyst + Competitive Intel + WTP Analyst only (3 Tasks, one message). Skip Claim Verifier. Inline synthesis. Prepend disclaimer: **"Quick mode — 3 analysts, no claim verification. Treat as directional."**

## Token Discipline (mandatory)

- Wave 1 agents: ≤ 600 words + structured block. No preamble.
- Claim Verifier: ≤ 700 words, `deep-research` Quick mode only — never Full.
- `last30days`: Community Analyst only. Never elsewhere.
- `deep-research`: Claim Verifier only. Never inside Wave 1.
- `INSUFFICIENT_DATA` if a search dimension returns nothing — no hallucinated estimates.
- Pass agent summary blocks to synthesis — not full transcripts.
- Never include full chat history in agent prompts.

## Anti-Patterns (never)

- `run_in_background: true` for Wave 1 — synthesis blocks on all 6
- Calling `last30days` in Search Demand, Competitive, or any non-Community agent
- Calling `deep-research` inside Wave 1 agents
- Spawning a synthesis agent — synthesis is always orchestrator-inline
- Sequential Wave 1 messages — batch all 6 in one
- Skipping Claim Verifier in Standard mode
- Letting agents exceed their word cap

## Wave Checklist

```
Standard:
- [ ] Step 0 frame written
- [ ] AGENTS.md read
- [ ] 6x Task spawned (one message)
- [ ] Wave 1 complete — all 6 returned
- [ ] Contested claims compiled (3–5)
- [ ] 1x Claim Verifier Task spawned
- [ ] VERDICT.md read
- [ ] Synthesis inline — verdict delivered

Quick:
- [ ] Step 0 frame written
- [ ] 3x Task spawned (Community + Competitive + WTP)
- [ ] Inline synthesis with disclaimer
```
