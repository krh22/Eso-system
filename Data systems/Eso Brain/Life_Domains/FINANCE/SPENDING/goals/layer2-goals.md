# ECS — Layer 2 Growth Goals
## System: Expenditure Control System | Nairobi, Kenya
**Total Income Trigger:** KES 12,000+ per month  
**Allocation Logic:** Percentage-based split of ALL income above KES 12,000.  

---

## Layer 2 — Growth Allocation Table

| Category | % | Priority | Storage | Rule |
|---|---|---|---|---|
| 1. Vault | 20% | Critical | Solana Blockchain | Locked for 90 days. No override. |
| 2. Fee Buffer | 1% | Essential | System Wallet | Covers Solana gas fees. |
| 3. Emergency | 10% | Essential | App Internal | 48hr cooldown period for release. |
| 4. Herbs | 8% | Capped | App Internal | Monthly cap, flexible 5-10%. |
| 5. Grooming | 5% | Capped | App Internal | Appearance & hygiene. |
| 6. Entertainment & Junk | 5% | Capped | App Internal | Controlled leisure spend. |
| 7. Women & Social | 7% | Capped | App Internal | Outings & relationships. |
| 8. Gifting & Helping | 5% | Capped | App Internal | Monthly giving cap. |
| 9. Equipment & Projects | 15% | Purpose | App Internal | Tools, builds, and upgrades. |
| 10. Business & Investing | 14% | Purpose | App Internal | Locked until Investing module is live. |
| 11. Buffer & Rollover | 10% | System | App Internal | Buffer for price fluctuations/conversion. |

---

## Category Definitions & Rules

### 1. Vault — 20% 🔒
- **Primary Goal:** Long-term wealth building.
- **Rules:** The moment income is received, 20% is converted to USDC and sent to a 90-day time-lock smart contract. If Ryan tries to withdraw early, the blockchain will reject the transaction. This is non-negotiable.

### 2. Fee Buffer — 1% ⛽
- **Primary Goal:** Ensure system stability.
- **Rules:** Covers the Solana transaction fees. If this bucket is empty, the system will block vault deposits until it is replenished.

### 3. Emergency (Top-up) — 10% 🛡️
- **Primary Goal:** Build a 6-month safety net.
- **Rules:** Requires a written reason for any withdrawal. Minimum 48-hour cooldown before funds move.

### 4–8. Discretionary Buckets (Herbs, Grooming, Social, etc.) ☕
- **Primary Goal:** Control lifestyle inflation.
- **Rules:** These buckets are flexible (within defined % ranges in `rules.json`). However, once a monthly cap is hit, it is a **HARD BLOCK**. No borrowing from next month or other buckets.

### 9. Equipment & Projects — 15% 🛠️
- **Primary Goal:** Asset acquisition and productivity tools.
- **Rules:** Only for items and projects that increase output or system efficiency. 

### 10. Business & Investing — 14% 📈
- **Primary Goal:** Yield-generating assets.
- **Rules:** This money is **LOCKED** until the Investing module (`investing.md`) is fully defined and active.

### 11. Buffer & Rollover — 10% 🌊
- **Primary Goal:** Smooth out volatility.
- **Rules:** Covers KES/USD fluctuation and miscellaneous tiny costs. Remaining balance rolls to the next month's Vault deployment or Buffer replenishment.

---

## Rule: The "Fresh Start" Protocol

At the end of every 30-day cycle:
1. Any remaining balance in buckets 4 through 8 is **wiped**.
2. That balance is moved to Category 11 (Buffer & Rollover).
3. The Buffer & Rollover balance is then evaluated for a one-time "Vault Injection."

*ECS v1.0 · Ryan Mwangi · 2026*
