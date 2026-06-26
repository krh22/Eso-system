# FMS — Food Management System
## Master Blueprint — v1.0 (Living Document)
**North Star Emotion: Peace**

---

### How to read this document
This file follows the Building Protocol step by step. Phases marked **Complete** are decided — don't relitigate them. Phases marked **Planned** or **Pending** are not built yet — they're intentionally light, because building them in detail before there's real usage data would be guessing. This is version 1 of the system itself, so this document is expected to change as FMS moves from blueprint to working prototype to refined system. When something changes, update the relevant section directly rather than starting a new file.

---

## Core Rules (apply to every decision below)

**The Ridiculously Simple Rule**
If I can't use it, it doesn't exist. FMS has to be easier to use than to ignore. Every feature, notification, or input has to pass one test: *is this simpler than doing nothing?* Complexity kills consistency, and consistency is what actually produces results.

**The Peace Filter**
Every decision gets measured against one question: *does this bring me peace?* If something creates anxiety, complexity, or friction, it gets cut or redesigned — no exceptions.

---

## PHASE 1 — Foundation
**Status: Complete**

### Step 1 — Name, Vision & Purpose

**Name:** FMS (Food Management System)

**Why this exists:**
- Stop the stress of being broke with no food in the house
- Stop the exhausting cycle of replanning groceries and meals every two days
- Fuel my body properly, with macros and micros adjusted to real activity, not guesswork
- Avoid overeating or undereating through meals that adjust dynamically
- Still work when I'm not the one cooking
- Keep food finances under control — know what's low, know what to budget
- Give me clear data on what I've eaten, what I need, and what to cut
- Work with rough estimates when exact measurement isn't possible
- Act as a combined chef and nutritionist, giving me control over food and money even when money is tight
- Be flexible and rigid at the same time, because life is both

**What it should feel like (the visualization):**
I'm at my desk. A notification arrives: "Today: cook 500g rice, steam cabbage, buy meat," with full recipes attached. The system already checked my stock — everything's accounted for. It tells me exactly what to buy, and the money for it is already set aside, so that's all I can spend on food. When I have company, I tell the system and it adjusts quantities, recipes, and budget instantly. The shopping list is ranked by urgency — buy now vs. buy later. The system reviews and improves itself over time.

**North Star Emotion:** Peace

---

### Step 2 — Raw Needs Dump
Everything FMS needs to do or handle, unfiltered:

- Track macro and micro nutrients
- Suggest what to take or avoid, based on health data and current research
- Adjust to current activity — exercise, fasting, partying, etc.
- Be AI-driven enough to feel almost human
- Have access to the web and large datasets
- Send reminders
- Store logs for statistics and pattern recognition
- Run a finance layer that controls food spending
- Lock funds for food — only what's allocated is accessible
- Have a guest mode that adjusts budget automatically when there's company
- Handle all three scenarios: cooked at home, bought outside, or cooked by someone else
- Provide recipes
- Send notifications
- Run reviews
- Give suggestions
- Use live data
- Be an AI I can talk to and make changes with
- Manage shopping
- Track perishability — what expires when
- Track consumption rate
- Handle emergencies and disasters
- Flag when money is low
- Track buying locations — stores, prices, preferences
- Learn my likes and dislikes over time
- Function like an expert chef and nutritionist combined
- Track and control prices

---

### Step 3 — Initial Direction Map

**Two pillars:**
1. **Real-time reports** — available anytime, with notifications arriving at scheduled times (eating, shopping, cooking)
2. **Interactive AI** — I can talk to it, and it reads/writes data instantly

**Daily flow:**
- Morning: a full report — how I'm doing, what today should ideally look like, what needs improving, what's already better
- During the day: notifications at the right moments (eat, shop, cook)
- When things change (energy dips, cravings shift, location changes): I talk to the AI and it updates everything instantly
- The plan adapts to current or planned activity (exercise, studying, etc.)

**Key design principles:**
- Rigid structures get reasonable time-locks so I can test if they actually work
- Logging has to be super easy — estimates are fine when exact measurement isn't possible
- Meal prep is supported
- Food estimation works even for meals I didn't cook myself
- Inconsistent logging doesn't break the system — it works with whatever it gets
- Regular reviews evaluate performance and drive changes

**The core promise:** Reports + an AI I can talk to = Iron Man's system, but for food.

---

## PHASE 2 — Research & Blueprint
**Status: Complete**

### Step 4 — External Research
*(The full research write-up lives in a separate file: `FMS_Step4_External_Research.md`. Below is the condensed, actionable version.)*

**What to borrow:**
- **Fitia** — multimodal input (photo, voice, text, barcode), grounded against a verified database
- **Cronometer** — a full micronutrient view, not just macros
- **"Your Food"** — inventory, budget, and shopping list treated as one connected loop
- **FoodiePrep / SummitPlate** — ingredient-overlap optimization to cut waste and cost
- **OpenFoodFacts** — a free, open nutrition/barcode database with an API
- **DietAI24's approach** — separate "what is this food" (AI vision) from "what does it actually contain" (database lookup)
- **isair/jarvis** — smart tool routing, a planner that sequences multi-step requests before acting, and "digest passes" to keep context lean
- **Personal_AI_Infrastructure** — a formal review loop: Observe → Think → Plan → Build → Execute → Verify → Learn

**What to avoid:**
- Blockchain-verified sourcing — complexity with no real personal-use payoff
- True ambient sensors (smart bins) — commercial tech, not consumer-ready
- "Best of" marketing lists — often self-serving; weight technical/academic sources higher
- Asking one AI model to do vision + nutrition math from a single photo — unreliable for mixed meals; use database-grounded lookup instead

**Open territory — where FMS is building into a real gap:**
- Hard financial locking — no consumer tool treats money as a real-time, locked variable alongside nutrition
- A real urgency-scoring model for perishables — nothing published beyond simple expiry-date reminders
- External meal estimation — still an active research problem, no one's solved ambiguous/cultural food description well
- True conversational replanning — no existing tool lets you say "swap this" and have meal plan, shopping list, and budget recalculate together instantly

**The single most important takeaway:**
> Nothing on the market treats money as a first-class, real-time, locked variable the way nutrition or inventory are treated. That's the actual white space FMS is building into. The discipline challenge isn't designing the lock — it's actually obeying it.

---

### Step 5 — Revised Blueprint
*Internal map (Step 3) synthesized with external research (Step 4).*

1. **Core structure:** "Reports + an AI I can talk to" — **holds**, no change.
2. **Financial locking:** **Deferred.** Will be built when the Finance Protocol is developed and integrated with FMS. Current working assumption: a software-enforced ledger (n8n) tracking available balance.
3. **External meals:** **Adopted.** Build a personal reference set — photograph and weigh the 10–15 dishes eaten most often when someone else cooks. Do it once, use it as ground truth going forward.
4. **Logging:** **Adopted.** Default-and-correct (system pre-fills a guess based on history, I only act when it's wrong), supplemented with quick question-based prompts ("Did you eat your usual breakfast?").
5. **Guest mode:** **Adopted.** A separate social pot with its own cap. Saying "guest tonight" draws from that pot, leaving the main food fund's rules untouched.
6. **Perishability & urgency:** **Placeholder.** Full design deferred to Step 6 execution. Current preference: a simple Red/Yellow/Green traffic-light system over complex math.
7. **AI architecture:** **Adopted.** Tool-use against structured data (JSON in a database). The AI reads and writes through defined functions, not free-form chat memory — this is what makes it reliable.
8. **Review cycle:** **Rejected as proposed.** A bare three-section report (Simplify / Accelerate / Automate) isn't enough on its own. A fuller review structure will be custom-designed in Step 10.
9. **First priority:** **Prototype first.** Build the simplest working version, run it, review real usage, then adjust. Perfection comes after usage, not before it.
10. **What to discard:** **Undefined.** Nothing identified yet — to be decided during the Refine phase (Steps 7–9) once a prototype is actually running.

**The consolidated blueprint:**
FMS is a two-pillar system: real-time AI-generated reports, and a conversational AI I can talk to instantly.

The flow: I log food via default-and-correct or quick prompts (photo/voice for external meals, matched against my personal reference set) → the AI checks inventory, budget, and activity level using tool-calls against structured data → a morning report plus scheduled notifications tell me what to cook, buy, and prioritize → when I say "swap this" or "guests tonight," a planner sequences the update across meal plan, shopping list, and budget in one coordinated step, with guest spending routed through its own separate pot → financial locking stays software-enforced via n8n until the Finance Protocol is built → performance gets evaluated on a custom schedule designed in Step 10.

**Filters applied:**
- Does this bring peace? Yes — adaptability removes anxiety instead of adding it.
- Is this ridiculously simple? Yes — default-and-correct logging and a conversational AI remove friction rather than adding steps.

---

## PHASE 3 — Build & Operate
**Status: Planned**

### Step 6 — Execution & Tracking Systems

A simple starter version already exists in a separate file: **`FMS_Lite_v1.md`**. It covers basic daily logging, a three-list pantry check, a go-to cooking rotation, and a money-floor budget tracker — all on paper/notes, no software yet. The plan is to run that manually for two weeks before building or automating anything below.

**Build priority #1:** the simplest version that delivers the core promise — reports plus AI. No complex urgency models or full financial locking yet.

**Sub-systems to design in detail once the prototype is running:**

| # | Sub-system | Planned approach |
|---|---|---|
| a | Milestone manager | Phased rollout: (1) basic logging & reporting live, (2) AI chat integration live, (3) guest mode live, (4) finance integration live |
| b | To-do configuration | Folded into TTB — daily tasks include logging prompts and review checks |
| c | Logging protocol | Default-and-correct plus question-based prompts ("Log breakfast: [guess]. Correct? Y/N / Edit"). Photo/voice for external meals |
| d | Data management | Stored in `eso-system/food/` as structured JSON for meal plans, budgets, inventory, plus reference images for the personal food set |
| e | Review protocol | Custom-designed in Step 10 — will include consistency checks, budget adherence, and a satisfaction score |

---

## PHASE 4 — Refine
**Status: Pending**

### Steps 7, 8, 9 — Simplify, Accelerate, Automate

These run iteratively once the prototype is live and producing real usage data. The order is fixed: **simplify first, then accelerate, then automate.** Never reversed.

---

## PHASE 5 — Lock In
**Status: Pending**

### Step 10 — Trial & Upgrade
The prototype runs for a minimum of 14 days before any structural changes are made.

### Step 11 — Reminders
Notifications stay batched into the morning brief, to avoid notification fatigue.

### Step 12 — Scenario Testing
Best-case (perfect adherence) and worst-case (emergency, broken streak) scenarios get simulated against the Step 1 visualization, to confirm the system still delivers peace under stress, not just under ideal conditions.

---

## Decision Log & Notes

**Last updated:** June 2026
**Status:** Foundation and blueprint complete. Ready for Phase 3 (Build).

**Open questions to revisit:**
- *Financial locking:* full integration details wait for the Finance Protocol build.
- *Review cycle:* a complete, custom review structure still needs designing in Step 10 — the bare three-section version was rejected as insufficient on its own.
- *Discard list:* unknown until the Refine phase, once there's real usage to learn from.

---
**Next action:** Begin running `FMS_Lite_v1.md` for two weeks. Step 6's detailed sub-systems get designed only after that trial produces real data.
