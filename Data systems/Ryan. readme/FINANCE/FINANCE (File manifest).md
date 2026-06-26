---
STATUS: Active | Last updated: 2026-04-21 | Updated by: Antigravity
---

# FINANCE — File manifest
*Expenditure Control System (ECS) governance.*

## 📂 Local files in this folder
| # | File name | What it does | How often to read | Status |
|---|-----------|-------------|-------------------|--------|
| 1 | FINANCE (The whole finance system).md | Full overview of ECS — layers, phase, how it works | When lost on finance | Active |
| 2 | FINANCE (Handover).md | Current finance session state and next steps | Every finance session | Active |
| 3 | FINANCE (System checklist).md | Finance phase checklist — Phase B progress | Weekly | Active |
| 4 | FINANCE (Allocation).md | How money is split — Layer 1 survival, Layer 2 extra | When allocating income | Active |
| 5 | FINANCE (File manifest).md | This file — lists everything in the FINANCE folder | When looking for a finance file | Active |
| 6 | FINANCE (Monthly summary).md | Monthly spending and saving summary | Monthly review | Active |

---

## ⚙️ Active Module Paths (Spending)
*Technical locations for the live Expenditure Control System.*

| Path | File Name | Purpose |
|---|---|---|
| `finance/spending/` | `dashboard.html` | Primary interactive visual interface. |
| `finance/spending/` | `alerts.md` | System-generated notifications and warnings. |
| `finance/spending/` | `protocol.md` | Recovery instructions. |
| `finance/spending/logs/` | `transaction-log.md` | Permanent ledger of every transaction. |
| `finance/spending/data/` | `rules.json` | Live program logic and parameters. |
| `finance/spending/data/` | `bucket-state.json` | Live balance snapshot for every bucket. |
| `finance/spending/blockchain/` | `ecs_vault/` | Rust source code for Solana time-lock. |

---

## 🧱 Inactive Modules (Saving & Investing)
| Path | File Name | Status |
|---|---|---|
| `finance/saving/` | `readme.saving.md` | Skeleton |
| `finance/investing/` | `readme.investing.md` | Skeleton |
