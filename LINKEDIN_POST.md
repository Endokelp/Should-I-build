# LinkedIn Post

---

You have an idea. You want to build it. But should you?

Most founders answer that question wrong.

Not because they're bad at thinking — but because they ask the wrong people. They ask their friends ("sounds cool!"). They post in a Slack group ("I'd use that!"). They convince themselves the market is real because five people on Twitter liked the concept.

Then they spend six months building something nobody buys.

I've watched this happen more times than I can count. And I've done it myself.

The actual signals that matter aren't opinions. They're behaviors:
→ Are people already paying for inferior solutions?
→ Are there Reddit threads with 50+ upvotes complaining about this exact problem?
→ Has anyone built a manual workaround — and spent real time or money on it?
→ Do competitor reviews call out a specific gap, over and over?

These are painkiller signals. Painkillers get bought. Vitamins get abandoned.

The problem is that gathering real signals takes time. Properly validating an idea means checking Reddit communities, mining G2 and Capterra reviews, analyzing Google Trends, estimating market size bottom-up, identifying who owns the budget, and verifying that the market numbers you found aren't hallucinated. Done right, it's a week of research.

So I built a skill that does it in minutes.

---

**Introducing: Should I Build?**

A multi-agent market validation skill for Claude Code and Cursor.

You describe your idea. The skill:

1. Deploys 6 parallel research analysts — community pain, search demand, competitive landscape, market size, willingness to pay, and market timing — all running simultaneously
2. Uses the `last30days` skill to pull fresh Reddit, X, HN, YouTube, and TikTok signal on your idea space from the last 30 days
3. Runs a Claim Verifier (powered by `deep-research`) to fact-check contested market figures before scoring
4. Scores everything across 7 validation pillars
5. Delivers a verdict: BUILD / CONDITIONAL / PIVOT / STOP — with evidence citations, green flags, red flags, comparable companies, and one specific experiment to run next

---

The verdict scale:

🟢 **BUILD (30-35/35)** — Validated. Ship the smallest version this week.
🟡 **CONDITIONAL (22-29)** — One gap. Close it with a 2-week experiment, then go.
🟠 **PIVOT (15-21)** — The problem may be real. The approach isn't. Adjust one variable.
🔴 **STOP (<15)** — Save your months. A "stop" is a win.

There's also a kill condition: if there's zero evidence of anyone paying for any partial solution in the space — no paid tools, no workarounds, no spending signal — the verdict is automatically STOP. No score total overrides it. A beautiful product in a vitamin market is still a vitamin.

---

The framework is grounded in actual validation methodology:

- YC's tarpit idea detection and urgency-depth matrix
- Steve Blank's earlyvangelist profile (has the problem, knows they have it, is actively searching, has a workaround, has budget)
- Rob Fitzpatrick's Mom Test — behavioral commitments beat verbal enthusiasm every time
- Sean Ellis's 40% PMF rule
- Jobs-to-be-Done Four Forces model

The skill operationalizes these as agent mandates. Each analyst isn't doing generic research — it's running the specific behavioral checks these frameworks prescribe.

---

Two companion skills do the heavy lifting:

**`last30days`** (by @mvanhorn) — the Community Signal Analyst uses it to pull cross-platform social signal in one call. What people are actually saying right now, not last year.

**`deep-research`** (by @199-biotechnologies) — the Claim Verifier uses it in Quick mode to return VERIFIED / PARTLY / FALSE / UNVERIFIABLE on your most contested market claims before they get baked into the verdict.

One install command downloads all three.

---

To use it:

```
/sib A Notion-based client portal for freelancers — so clients can 
view project status, approve deliverables, and pay invoices 
without email threads.
```

That's it. The rest happens automatically.

---

The skill is open-source and free. Built on the Everything Claude Code skill pattern. Token-efficient by design — no session-eating context windows.

Link to the repo in the comments.

If you've been sitting on an idea and not sure if it's real: try it. The worst outcome is a STOP verdict that saves you six months. The best outcome is a BUILD verdict with a specific next step and evidence behind it.

Either way, you'll know.

---

#buildinpublic #solofounder #startupvalidation #claudecode #cursor #aitools #indiemaker #pmf #founder
