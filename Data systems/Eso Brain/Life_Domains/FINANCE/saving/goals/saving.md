# ECS — Saving Module
## The Protection Layer

*Version 1.0 · Nairobi, Kenya*

---

## 1. The Strategy: Tiered Cash Reserves

The Saving Module is designed to protect Ryan from debt and provide the liquidity needed for major life moves. It is split into three tiers based on time and purpose.

### Tier 1: Short-Term (The Slip-up Buffer)
- **Timeframe:** 0 to 3 months.
- **Purpose:** Minor emergencies, repairs, or small opportunistic buys.
- **Target Amount:** KES 50,000.
- **Strategy:** High liquidity. Kept in easily accessible digital wallets.

### Tier 2: Mid-Term (Life Upgrade)
- **Timeframe:** 3 to 12 months.
- **Purpose:** Rent deposits for better housing, new electronics, or travel.
- **Target Amount:** KES 150,000.
- **Strategy:** Money Market Funds (MMF) or high-yield savings accounts.

### Tier 3: Long-Term (The Foundation)
- **Timeframe:** 1 year+.
- **Purpose:** Large capital projects, house down-payment, or major life shifts.
- **Target Amount:** KES 500,000.
- **Strategy:** Locked accounts or low-risk government bonds.

---

## 2. Global Saving Rules

1. **The 10% Floor:** Minimum 10% of all Layer 2 income must go to the Saving Module before any discretionary spending.
2. **Sequential Filling:** Tier 1 must be 50% full before any money enters Tier 2. Tier 2 must be 20% full before money enters Tier 3.
3. **No Liquidation:** Saving buckets cannot be "liquidated" to cover overspending in the Discretionary buckets (Herbs/Social).
4. **Emergency Priority:** If the `emergency` bucket in `rules.json` is used, the Saving Module pauses all growth and directs all 10% Layer 2 income to replenish the Emergency fund first.

---

## 3. Storage Hierarchy

| Tier | Recommended Platform | Access Time |
|---|---|---|
| Tier 1 | M-Pesa / Digital Wallet | Instant |
| Tier 2 | Sanlam / CIC MMF | 24–48 Hours |
| Tier 3 | T-Bills / Locked Bank A/C | 30–91 Days |

---

## 4. Current Milestone

**Status:** INACTIVE (Locked until Tracker is built)  
**Next Goal:** Populate `saving-tracker.json` with initial balances.
