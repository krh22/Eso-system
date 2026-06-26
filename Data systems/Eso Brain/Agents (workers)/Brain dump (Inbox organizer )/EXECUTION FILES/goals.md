# ECS — Expenditure Control System
## Goals: Layer 1 — Survival Allocation

**Owner:** Ryan Mwangi  
**Location:** Nairobi, Kenya  
**Last Updated:** 2026-04-20  
**Income Base:** KES 12,000 / month (guaranteed)  
**Status:** 🔒 LOCKED — No modifications without system override

---

## Layer 1 — Monthly Allocation Table

| # | Category              | Amount (KES) | % of Income | Status         |
|---|-----------------------|-------------|-------------|----------------|
| 1 | Rent / Housing        | 5,000       | 41.7%       | 🔒 Hard Locked |
| 2 | Food & Groceries      | 4,000       | 33.3%       | 🔒 Sealed      |
| 3 | Transport             | 1,200       | 10.0%       | 🔒 Essential   |
| 4 | Utilities & Sanitation| 1,000       | 8.3%        | 🔒 Essential   |
| 5 | Herbs                 | 600         | 5.0%        | 🔶 Hard Capped |
| 6 | Remainder             | 200         | 1.7%        | 🔁 Auto-Rolls  |
|   | **TOTAL**             | **12,000**  | **100%**    |                |

---

## Category Definitions

### 1. Rent — KES 5,000 🔒
- **Type:** Hard Locked
- Paid on the **1st of every month**, no exceptions.
- Cannot be borrowed from, redirected, or deferred.
- No other category may access these funds.
- If income is received late, rent is still the first payment made.

### 2. Food & Groceries — KES 4,000 🔒
- **Type:** Sealed Bucket
- Food purchases only — groceries, cooking supplies, drinking water.
- Eating out is included only if it replaces a meal at home.
- No luxury food items (snacks, sodas, fast food) unless from the remainder.
- Weekly sub-limit: KES 1,000. Any week unused rolls forward within the month only.

### 3. Transport — KES 1,200 🔒
- **Type:** Essential Travel Only
- Covers matatu fare, boda boda, and essential fuel.
- No ride-hailing apps unless no alternative exists.
- Social travel (outings, visits) is not covered by this category.
- Unused balance does not roll over — it goes to the emergency fund.

### 4. Utilities & Sanitation — KES 1,000 🔒
- **Type:** Essential
- Covers electricity tokens, water, internet bundles, soap, cleaning supplies, toiletries.
- No cosmetics or non-sanitation items from this bucket.
- If electricity or water is prepaid, prioritize those before discretionary items.

### 5. Herbs — KES 600 🔶
- **Type:** Hard Capped
- Maximum spend is KES 600. Cannot be exceeded under any circumstance.
- No rollover — unused balance does not carry to next month.
- Every purchase logged with date, item, amount, and vendor.

### 6. Remainder — KES 200 🔁
- **Type:** Auto-Rollover
- Automatically transferred to the Emergency Fund at month-end.
- Cannot be spent during the month — it is pre-allocated to emergency.
- If any category has a saved balance, it is also rolled here at month-end.

---

## System Rules

> These rules govern all spending decisions in the ECS. They are non-negotiable at Layer 1.

1. **Sealed Buckets** — Each category is a sealed container. Money allocated to Rent stays in Rent. Money allocated to Food stays in Food. No transfers between categories.

2. **No Cross-Category Spending** — Spending from the wrong category is a system violation. All violations must be logged as an ADJUSTMENT entry in `logs/log.md`.

3. **Every Transaction Is Logged** — Every deposit, withdrawal, transfer, and decision is recorded in `logs/log.md` with date, time, amount, category, and reason. No exceptions.

4. **No Unauthorized Withdrawals** — No money may be withdrawn from any category without a logged reason that matches the category's definition. Unauthorized withdrawals escalate to a system review.

5. **Rent Is Always First** — When income arrives, Rent is allocated before any other category. The system does not run without rent being secured.

6. **Savings Rule (Remainder)** — The KES 200 remainder is not discretionary spending. It belongs to the emergency fund the moment income is received.

7. **No Debt Against Future Income** — Layer 1 does not allow borrowing against next month's income. If an expense cannot be covered this month, it is either deferred or escalated.

8. **Monthly Review Required** — On the 1st of every month, the agent runs a full health check before any spending begins. Allocations are confirmed against this file.

---

## Emergency Fund Tracker

| Month     | Amount Added (KES) | Total Balance (KES) | Notes        |
|-----------|-------------------|---------------------|--------------|
| April 2026| 200               | 200                 | System init  |

---

## Layer 2 Preview (Unlocked Above KES 12,000)

Any income above KES 12,000 is governed by **Layer 2 — Growth Allocation**.  
Layer 2 categories include: Vault, Emergency top-up, Equipment, Business, and Social.  
See `calculator.html` for live Layer 1 / Layer 2 calculations.

---

*ECS v1.0 — Initialized 2026-04-20 — Nairobi, Kenya*
