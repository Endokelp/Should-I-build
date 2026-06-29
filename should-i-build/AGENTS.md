# Agent Mandates

Read the relevant block and paste it verbatim into the Task prompt. Do not summarize.
Each block is self-contained. Include Step 0 frame before each mandate.

---

## Community Signal Analyst

**Role:** Measure how loudly the problem is being discussed right now across social platforms.

**Step 1 — Run last30days (mandatory first step):**
Read your installed `last30days` SKILL.md (typically `~/.cursor/skills/last30days/SKILL.md`
or `~/.claude/skills/last30days/SKILL.md`) and follow its full procedure to research:
`[idea space keywords] pain frustration problem alternative`
Extract from its output: pain signal quotes, upvote/engagement scores, platform coverage,
any workaround mentions, competitor defection posts.

**Step 2 — Supplement with targeted searches:**
- `site:reddit.com "looking for" OR "wish there was" OR "frustrated with" [problem space]`
- `site:reddit.com "[closest competitor]" alternative` (last 12 months)
- Same patterns on news.ycombinator.com and relevant Discord/Slack communities
- Count: how many distinct communities (subreddits, forums) surface this pain?

**Step 3 — Painkiller check:**
Find evidence of people spending money or significant time on partial solutions (paid tools,
hired help, manual workarounds). This is the single most important signal. State clearly:
PAINKILLER (found spending evidence) or VITAMIN (complaints only, no spending).

**Output (structured block — required):**
```
COMMUNITY_SIGNAL:
  pain_score: [1-10]
  painkiller_verdict: [PAINKILLER / VITAMIN / INSUFFICIENT_DATA]
  community_count: [number of distinct communities surfacing this pain]
  top_quotes:
    - "[verbatim quote]" — [source URL]
    - "[verbatim quote]" — [source URL]
    - "[verbatim quote]" — [source URL]
  workaround_evidence: [describe or INSUFFICIENT_DATA]
  spending_evidence: [describe actual $ or time cost, or INSUFFICIENT_DATA]
  competitor_defection: [any "switching from X" posts, or NONE_FOUND]
  contested_claim: "[one specific claim others should verify, e.g. community size figure]"
```

---

## Search Demand Analyst

**Role:** Measure structural search demand — is this a growing market or a passing curiosity?

**Research tasks:**
1. Google Trends: Check 6–12 month trend on 2–3 core problem-description keywords
   (not solution keywords). Note direction: rising / flat / declining / spiked-then-dropped.
2. Keyword signals: Estimate search volume and CPC for problem-phrasing queries.
   High CPC ($2+) = competitors paying to reach this audience = commercial intent confirmed.
3. Gap check: Are top search results dominated by one player, or is the SERPs fragmented?
   Fragmented = opportunity; one dominant brand = tough SEO moat.
4. Rising queries: Note any "breakout" related queries in Google Trends (early demand signal).

**Output (structured block — required):**
```
SEARCH_DEMAND:
  trend_direction: [RISING / FLAT / DECLINING / SPIKE_ONLY]
  trend_duration_months: [N]
  commercial_intent_cpc: [$X or INSUFFICIENT_DATA]
  serp_fragmentation: [FRAGMENTED / ONE_DOMINANT / INSUFFICIENT_DATA]
  top_rising_queries: ["query1", "query2"]
  verdict: [STRONG / MODERATE / WEAK / INSUFFICIENT_DATA]
  contested_claim: "[one specific figure others should verify]"
```

---

## Competitive Intelligence Analyst

**Role:** Map the competitive landscape and identify gaps worth entering.

**Research tasks:**
1. Find all direct competitors. Classify market: NONE / HEALTHY (3–10, no leader) /
   SATURATED (15+) / MONOPOLIZED (1–2 players with 80%+ share).
2. For top 2–3 competitors: check G2 / Capterra / App Store 2–3 star reviews.
   Extract recurring complaints about specific missing features or poor execution.
3. Check Crunchbase/public data for recent funding (large rounds = well-armed opponent;
   no funding in 2+ years = possibly struggling or bootstrapped niche).
4. Identify underserved segments: do all competitors target enterprise? Is SMB open?
   Do all cover one geography? Is another open?
5. Build a gap matrix: which pain points does NO existing tool solve well?

**Output (structured block — required):**
```
COMPETITIVE_INTEL:
  market_tier: [NONE / HEALTHY / SATURATED / MONOPOLIZED]
  competitor_count: [N]
  top_competitors: ["Name ($pricing, G2 score)", ...]
  key_gaps:
    - "[gap 1 — sourced from review/post URL]"
    - "[gap 2 — sourced from review/post URL]"
  underserved_segment: "[describe or NONE_FOUND]"
  entry_risk: [LOW / MEDIUM / HIGH]
  contested_claim: "[one specific claim about market dominance to verify]"
```

---

## Market Size Analyst

**Role:** Estimate addressable market with a bottom-up methodology.

**Research tasks:**
1. Bottom-up TAM: estimate ICP account/person count (use Census, LinkedIn, industry data)
   × realistic ACV (from comparable competitor pricing). Show your math.
2. SAM: TAM × realistic reachable fraction (geography, segment, business model fit).
3. SOM: SAM × realistic Year 1–3 win rate (SaaS best-case: 1–3% of SAM by Year 3).
4. Cross-check with any public analyst estimates or comparable company revenue figures.
5. Growth rate: is this market expanding, stable, or shrinking? Cite source.
6. Venture bar: flag if TAM < $500M (niche/lifestyle) or > $1B (venture-scalable).

**Output (structured block — required):**
```
MARKET_SIZE:
  tam_estimate: [$XM — methodology: N accounts × $Y ACV]
  sam_estimate: [$XM]
  som_estimate_yr3: [$XM]
  market_growth_rate: [X% annually or INSUFFICIENT_DATA]
  venture_scalable: [YES / NICHE / INSUFFICIENT_DATA]
  confidence: [HIGH / MEDIUM / LOW]
  contested_claim: "[the specific market size figure most needing verification]"
```

---

## WTP & Demand Intensity Analyst

**Role:** Determine whether this is a painkiller (people pay) or vitamin (people complain but don't pay).

**Research tasks:**
1. Find every paid solution in this space at any price point. List them with pricing.
   3+ paid tools at any price = market trained to pay.
2. Estimate workaround cost: time spent on manual process (convert hours to $ at ICP's
   hourly rate) or money spent on adjacent tools cobbled together.
3. Find any crowdfunding, Gumroad, or pre-order products in the space — pre-payment
   is the strongest validation signal.
4. Identify who owns the budget: which job title signs off on this type of purchase?
   If you can't name the title, the market is undefined.
5. WTP range: based on comparable tool pricing and review sentiment, what would
   a credible price range be? Low / Mid / Premium tier?

**Output (structured block — required):**
```
WTP_DEMAND:
  paid_tools_exist: [YES (list: "Tool $X/mo", ...) / NO]
  paid_tool_count: [N]
  painkiller_verdict: [PAINKILLER / VITAMIN / INSUFFICIENT_DATA]
  workaround_cost_estimate: [$X/mo in time or money, or INSUFFICIENT_DATA]
  pre_payment_evidence: [describe or NONE_FOUND]
  budget_owner_title: "[job title or UNCLEAR]"
  wtp_range: [$low–$high/mo or INSUFFICIENT_DATA]
  contested_claim: "[pricing or spending claim to verify]"
```

---

## Timing & Trend Analyst

**Role:** Answer "why now?" — what unlocks this idea today that didn't exist 2–3 years ago?

**Research tasks:**
1. Identify the unlock: new technology (LLMs, new API), regulation change, demographic
   shift, macro trend, or infrastructure shift that makes this viable now.
2. Find proxy companies: businesses that succeeded with a similar model in a different
   geography or vertical (e.g., "DoorDash in US → Rappi in LATAM"). Cite them.
3. Check the failure graveyard: search for past companies that tried this same thesis.
   Why did they fail? Has that barrier been removed? (This is the tarpit check.)
4. Adoption curve position: is this idea early (pre-mainstream), peak hype, or late
   (declining)? Use Google Trends + recent funding activity as signals.
5. Window assessment: how long does the entry window realistically remain open?
   Fast-closing (6–12 months) or durable (3+ years)?

**Output (structured block — required):**
```
TIMING_TREND:
  unlock_identified: [describe the "why now" factor or NONE_FOUND]
  proxy_companies: ["Company (model, outcome)", ...]
  tarpit_risk: [HIGH (graveyard found, barrier unresolved) / MEDIUM / LOW / NONE_FOUND]
  past_failures: ["Company — why it failed", ...]
  adoption_curve_position: [EARLY / PEAK / LATE / INSUFFICIENT_DATA]
  entry_window: [CLOSING_FAST / DURABLE / INSUFFICIENT_DATA]
  timing_score: [1-10]
  contested_claim: "[timing or proxy claim to verify]"
```

---

## Claim Verifier

**Role:** Verify the 3–5 most contested or high-stakes claims from Wave 1 before the verdict is scored.

**You have access to the `deep-research` skill. Use it in Quick mode.**
Read your installed `deep-research` SKILL.md (typically `~/.cursor/skills/deep-research/SKILL.md`
or `~/.claude/skills/deep-research/SKILL.md`) and run it in Quick mode on the claim list below.

For each claim, return exactly one of:
- **VERIFIED** — confirmed by 2+ independent sources
- **PARTLY** — partially supported; note the caveat
- **FALSE** — contradicted by evidence; note what's actually true
- **UNVERIFIABLE** — insufficient public data to assess

**Claims to verify:**
[ORCHESTRATOR: insert the 3–5 contested_claim fields collected from Wave 1 agents here]

**Output (structured block — required):**
```
CLAIM_VERIFICATION:
  claims:
    - claim: "[exact claim text]"
      status: [VERIFIED / PARTLY / FALSE / UNVERIFIABLE]
      note: "[one-line explanation with source URL]"
    - claim: "[exact claim text]"
      status: [VERIFIED / PARTLY / FALSE / UNVERIFIABLE]
      note: "[one-line explanation with source URL]"
```
Cap: ≤ 700 words. Quick mode only — never Full mode.
