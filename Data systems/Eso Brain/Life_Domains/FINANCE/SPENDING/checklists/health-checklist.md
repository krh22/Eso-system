# Health Check — ECS Spending Module
*Run this every 30 days. Simple and honest.*

---

## Section 1 — Balances Check
- [ ] Open dashboard and confirm all bucket balances match expected amounts.
- [ ] Check vault balance on Solana matches vault deployment log.
- [ ] Check emergency balance is intact and untouched if no emergency occurred.
- [ ] Check giving balance and confirm reset happened on correct date.
- [ ] Check buffer and rollover balance.
- **Result:** [Pass / Fail]

## Section 2 — Log Review
- [ ] Open `log.md` and scroll through the month.
- [ ] Count total deposits and confirm all triggered correct allocations.
- [ ] Count total spending entries and confirm no category went over its cap.
- [ ] Open blocked attempts log and read every entry. Note which bucket was attacked most this month.
- **Result:** [Pass / Fail]

## Section 3 — Vault Check
- [ ] Confirm vault deployment happened for every Layer 2 deposit this month.
- [ ] Confirm unlock date is correct.
- [ ] Confirm USDC amount on chain matches records.
- **Result:** [Pass / Fail]

## Section 4 — Rules Check
- [ ] Open `rules.json` and confirm no values were changed without a logged reason.
- [ ] Check flexible value change log for any changes this month.
- [ ] If changes were made, confirm they were within allowed flex range.
- **Result:** [Pass / Fail]

## Section 5 — Honest Self Check
*This section is for Ryan only and is never judged, only observed.*
- **Did you try to break the system this month?** (Yes / No)
- **If yes, which bucket did you attack?** 
- **What triggered it?** 
- **What will you change about your behaviour next month?** 

## Section 6 — Next Month Preparation
- [ ] Confirm Layer 1 allocations are still correct for next month.
- [ ] Adjust any flexible values if needed with logged reason and 24-hour cooldown.
- [ ] Check if any Solana contracts are unlocking next month and plan for reallocation.
- [ ] Update `readme.ryan.md` checklist with anything newly completed.
