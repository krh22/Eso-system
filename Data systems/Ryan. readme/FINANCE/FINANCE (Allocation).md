# FINANCE (Allocation)
This file is the single source of truth for how Ryan's money is split across every bucket. Ryan reads and edits this file to adjust the system.

---

## Section 1 — How to read this file
This file shows how every shilling is allocated. To change a value, read the instructions at the bottom before touching anything.

---

## Section 2 — Layer 1 Survival Allocation Table
*Triggered when total monthly income is KES 12,000 or below.*

| Category | Amount (KES) | % | Lock Type | Flex Min | Flex Max | Rule |
|---|---|---|---|---|---|---|
| Rent | 5,000 | 41.7% | Hard Locked | N/A | N/A | First payment always. |
| Food | 4,000 | 33.3% | Hard Locked | N/A | N/A | Food only. |
| Transport | 1,200 | 10.0% | Capped | 800 | 1,500 | Essential travel only. |
| Utilities | 1,000 | 8.3% | Capped | 800 | 1,200 | Sanitation only. |
| Herbs | 600 | 5.0% | Capped | 300 | 800 | Hard monthly cap. |
| Remainder | 200 | 1.7% | Auto Roll | N/A | N/A | Goes to emergency. |

---

## Section 3 — Layer 2 Growth Allocation Table
*Triggered for every KES earned above the initial 12,000.*

| Category | % | Lock Type | Cooldown | Rule |
|---|---|---|---|---|
| Vault | 20% | Solana Locked | 90 Days | No override exists. |
| Fee Buffer | 1% | System Held | N/A | Covers Solana fees. |
| Emergency | 10% | App Locked | 48 Hours | Request release via dashboard. |
| Herbs | 8% | Capped | N/A | Monthly herb allocation. |
| Grooming | 5% | Capped | N/A | Appearance & hygiene. |
| Entertainment & Junk | 5% | Capped | N/A | Leisure spending. |
| Women & Social | 7% | Capped | N/A | Relationships & outings. |
| Giving | 5% | Capped | 30 Days | Resets every month. |
| Equipment & Projects | 15% | Purpose Locked | N/A | Requires written reason. |
| Business & Investments| 14% | Locked | N/A | Wait for Saving module activity. |
| Buffer & Rollover | 10% | System Held | N/A | Rolls to next month. |

---

## Section 4 — How to change a value
1. **Check if Flex:** Check if the value is marked "flex". If not marked flex, you cannot change it.
2. **Check Range:** If flex, check the "Flex Min" and "Flex Max" columns. Your new value must stay inside that range.
3. **Update Logic:** Open `rules.json` in `spending/data/` and update the value there.
4. **Log Reason:** Write the reason for the change in `flexible_value_change_log` inside `rules.json`.
5. **Wait for Effect:** Wait 24 hours before the change takes effect.
6. **Sync Reference:** Update this file (`FINANCE (Allocation).md`) to match.
7. **Audit:** The system logs all changes automatically.

---

## Section 5 — What Ryan needs to do himself
1. **Get Phantom:** Get a Phantom wallet on Solana and paste the address into `rules.json` under `solana_settings.wallet_address`.
2. **Study Streamflow:** Study [Streamflow.finance](https://streamflow.finance) — this is the Solana time-lock tool for the vault. No need to build a smart contract from scratch.
3. **KES to USDC:** Decide how to convert KES to USDC — recommended options are Binance or Yellow Card Kenya.
4. **Safety First:** Never put wallet addresses or private keys in any file on the planning laptop. Only add them on the main machine.
5. **Small Test:** Test the vault with a very small amount first before sending real money.
