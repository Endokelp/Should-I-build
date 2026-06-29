# Verdict Framework

Read this during Step 3 (inline synthesis). Score each pillar, check the kill condition, determine the verdict.

## 7-Pillar Scorecard

Score each pillar 0–5 based on **evidence strength**, not optimism.

| Score | Meaning |
|---|---|
| 0 | No evidence / negative evidence. Assumption only. |
| 1–2 | Weak — partial data, mostly assumed. |
| 3 | Moderate — some customer/market data with reasonable assumptions. |
| 4–5 | Strong — behavioral evidence, real spending, verified metrics. |

### Pillar Scoring Guide

**1. Problem Clarity** — Is the pain urgent, specific, and frequent?
- 5: Community Analyst found 5+ subreddits with 50+ upvote threads; verbatim pain language is consistent
- 3: Pain confirmed in 1–2 communities; language varies
- 0: No community discussion found; problem is assumed

**2. Target Customer** — Can you name exactly who, in what situation, with what budget authority?
- 5: Specific job title identified; budget owner named; reachable acquisition channel exists
- 3: General demographic known; budget owner unclear
- 0: "Everyone" / no specific buyer defined

**3. Demand Signal** — Behavioral evidence of demand (spending, workarounds, pre-orders)
- 5: 3+ paid tools exist AND workaround cost estimated AND spending evidence found
- 3: Paid tools exist but no workaround cost evidence
- 1: Complaints only, no spending evidence anywhere
- 0: No signal of anyone paying for any partial solution

**4. Differentiation** — Is there a gap no existing tool fills well?
- 5: Gap matrix shows 2+ specific unmet needs sourced from reviews; underserved segment identified
- 3: Some gaps found but competitors are partially addressing them
- 0: Market is saturated or monopolized with no clear entry angle

**5. Execution Feasibility** — Can this team realistically build this? *(use founder context if provided; otherwise score 3 as neutral)*
- 5: Founder-market fit evident; MVP scoped to < 8 weeks; technical capability clear
- 3: No founder context provided — neutral assumption
- 0: Requires capabilities or relationships clearly absent from founding team

**6. Distribution Readiness** — Is there a realistic customer acquisition path?
- 5: Acquisition channel tested or clearly defined (community, SEO, outbound to named list)
- 3: Plausible channel exists; not yet tested
- 0: No clear channel; "build it and they'll come" assumption

**7. Monetization Viability** — Do the unit economics work?
- 5: WTP range established; LTV:CAC > 3:1 modeled with real comp data; market confirms willingness to pay
- 3: Comparable tools priced reasonably; economics plausible but unverified
- 0: No paid solutions in market; no evidence of willingness to pay

---

## Kill Condition (check before totaling)

> **If Demand Signal (Pillar 3) scores 0 or 1: verdict is STOP, regardless of total score.**

Demand cannot be compensated by other pillars. A well-differentiated, founder-fit product with no proven demand is a vitamin, not a business.

---

## Decision Thresholds

| Total Score | Verdict | Meaning |
|---|---|---|
| 30–35 | **BUILD** | All pillars validated. Launch smallest possible MVP immediately. |
| 22–29 | **CONDITIONAL** | 1–2 weak pillars. Run targeted 2–4 week experiment to close gaps before scaling. Name the specific gap. |
| 15–21 | **PIVOT** | Core problem may be real but approach, ICP, or pricing is wrong. Adjust one variable and re-validate. |
| < 15 | **STOP** | Fundamental validation failure. "Stop" is a win — it saved months of misdirected effort. |

---

## Green Flag Taxonomy

Strong signals (any one is significant):
- People already paying for inferior solutions (painkiller confirmed)
- Active workarounds in use (time or money spent)
- 5+ Reddit/HN threads across 3+ communities, last 90 days
- Competitors have 2–3 star reviews citing specific, unresolved gaps
- Proxy company validated same model in another context
- Google Trends rising 6–12 months sustained (not a spike)
- Early adopters hand you money without prompting

---

## Red Flag Taxonomy

Kill conditions:
- No paid solutions exist in this problem space (vitamin market)
- Enthusiasm in interviews but zero commitment (politeness ≠ demand)

High-severity:
- Single dominant monopolist with network effects + switching costs
- Market fragmented with 15+ players, none profitable
- No identifiable budget owner ("everyone would use it")
- Tarpit pattern — graveyard of failed companies with unresolved root cause

Medium-severity:
- Pain appears in only one community (thin signal)
- High search volume but zero community discussion (curiosity, not pain)
- Founding team has no domain access or expertise
- Requires changing deeply entrenched user behavior

---

## Confidence Level

Assign confidence % to the verdict:

| Situation | Confidence |
|---|---|
| Multiple VERIFIED claims, strong behavioral signals | 75–90% |
| Mixed PARTLY claims, moderate behavioral signals | 50–74% |
| UNVERIFIABLE claims, mostly community signals | 30–49% |
| Quick mode (no Claim Verifier run) | Max 60% |
