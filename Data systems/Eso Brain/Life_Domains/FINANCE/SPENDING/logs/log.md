# ECS — Expenditure Control System
## Module: Spending | Log Record
**Owner:** Ryan  
**Log Started:** [To be filled by Ryan]  
**Last Updated:** null  

---

## 1. Deposit Log
*Records every time money enters the system.*

| Date | Time | Amount (KES) | Source Description | Layer Triggered | Allocation Triggered | Notes |
|------|------|-------------|--------------------|-----------------|---------------------|-------|
| 2026-04-24 | 09:00 | 15,000 | Client Payment | Both | L1 and L2 | SAMPLE |
| 2026-04-24 | 12:30 | 5,000 | Freelance Gig | Layer 1 | Survival | SAMPLE |
| 2026-04-24 | 16:45 | 2,500 | Gift | Layer 1 | Survival | SAMPLE |

---

## 2. Allocation Log
*Records every time a deposit is split into buckets.*

| Date | Time | Deposit Amount (KES) | Bucket Name | Amount Allocated (KES) | Percentage | Allocation Type | Notes |
|------|------|----------------------|-------------|------------------------|------------|-----------------|-------|
| 2026-04-24 | 09:05 | 15,000 | Rent | 5,000 | 33.3% | L1 Survival | SAMPLE |
| 2026-04-24 | 09:05 | 15,000 | Vault | 3,000 | 20.0% | L2 Growth | SAMPLE |
| 2026-04-24 | 09:05 | 15,000 | Emergency | 1,500 | 10.0% | L2 Growth | SAMPLE |

---

## 3. Spending Log
*Records every time money leaves a bucket.*

| Date | Time | Bucket Name | Amount Spent (KES) | Purpose | Approved | Remaining Balance (KES) | Notes |
|------|------|-------------|-------------------|---------|----------|------------------------|-------|
| 2026-04-24 | 10:15 | Food | 450 | Groceries | Yes | 3,550 | SAMPLE |
| 2026-04-24 | 11:00 | Transport | 100 | Matatu fare | Yes | 1,100 | SAMPLE |
| 2026-04-24 | 13:20 | Herbs | 200 | Monthly supply | Yes | 400 | SAMPLE |

---

## 4. Vault Deployment Log
*Records every time money is sent to the Solana smart contract.*

| Date | Time | Amount (USDC) | KES Equivalent | Solana Tx ID | Duration (Days) | Unlock Date | Status | Notes |
|------|------|--------------|----------------|--------------|-----------------|-------------|--------|-------|
| 2026-04-24 | 09:10 | 22.50 | 3,000 | 5zX9...3p2k | 90 | 2026-07-23 | Locked | SAMPLE |
| 2026-04-24 | 10:00 | 15.00 | 2,000 | 8yB2...1m9j | 90 | 2026-07-23 | Locked | SAMPLE |
| 2026-04-24 | 14:30 | 7.50 | 1,000 | 3qR7...9n4s | 90 | 2026-07-23 | Locked | SAMPLE |

---

## 5. Emergency Release Log
*Records every time emergency fund is accessed.*

| Date | Time | Amount Released (KES) | Reason Given | Cooldown Started | Cooldown Expired | Approved | Remaining Balance (KES) | Notes |
|------|------|-----------------------|--------------|------------------|------------------|----------|-------------------------|-------|
| 2026-04-24 | 08:00 | 0 | Medical bill (request) | 2026-04-24 | 2026-04-26 | Pending | 10,000 | SAMPLE |
| 2026-04-24 | 11:15 | 1,200 | Urgent repair | 2026-04-22 | 2026-04-24 | Yes | 8,800 | SAMPLE |
| 2026-04-24 | 15:00 | 0 | Travel (rejected) | N/A | N/A | No | 8,800 | SAMPLE |

---

## 6. Giving and Helping Log
*Records every time giving bucket is used.*

| Date | Time | Amount (KES) | Recipient Description | Reason | Remaining Balance (KES) | Monthly Reset Date | Notes |
|------|------|-------------|-----------------------|--------|-------------------------|--------------------|-------|
| 2026-04-24 | 10:30 | 500 | Relative | Support | 1,500 | 2026-05-24 | SAMPLE |
| 2026-04-24 | 12:00 | 200 | Street help | Kindness | 1,300 | 2026-05-24 | SAMPLE |
| 2026-04-24 | 16:00 | 300 | Friend | Loan | 1,000 | 2026-05-24 | SAMPLE |

---

## 7. Bucket Change Log
*Records every time a flexible value is changed.*

| Date | Time | Bucket Name | Old Value | New Value | Reason Given | Cooldown Started | Cooldown Expires | Approved | Notes |
|------|------|-------------|-----------|-----------|--------------|------------------|------------------|----------|-------|
| 2026-04-24 | 09:30 | Transport | 1,200 | 1,500 | Fuel price hike | 2026-04-24 | 2026-04-25 | Pending | SAMPLE |
| 2026-04-24 | 11:45 | Utilities | 1,000 | 800 | Saved on water | 2026-04-23 | 2026-04-24 | Yes | SAMPLE |
| 2026-04-24 | 14:15 | Herbs | 600 | 500 | Reducing use | 2026-04-22 | 2026-04-23 | Yes | SAMPLE |

---

## 8. System Events Log
*Records system starts, rule changes, errors, and failed attempts.*

| Date | Time | Event Type | Description | Triggered By | Notes |
|------|------|------------|-------------|--------------|-------|
| 2026-04-24 | 08:30 | System Start | Command Center Init | Ryan | SAMPLE |
| 2026-04-24 | 13:00 | Rule Update | Added Binance bridge | System | SAMPLE |
| 2026-04-24 | 17:00 | Data Sync | Synced with main machine | System | SAMPLE |

---

## 9. Blocked Attempts Log
*Records every time the system blocks an action against the rules.*

| Date | Time | Bucket Name | Attempted Action | Reason Blocked | Notes |
|------|------|-------------|------------------|----------------|-------|
| 2026-04-24 | 10:45 | Food | Spend 5,000 | Insufficient Balance | SAMPLE |
| 2026-04-24 | 14:00 | Vault | Withdraw 1,000 | Locked for 90 days | SAMPLE |
| 2026-04-24 | 16:30 | Rent | Transfer to Herbs | Category is Sealed | SAMPLE |

---

## Log Rules

1. Every transaction is logged automatically.
2. No entry can be deleted; entries can only be flagged.
3. Flagged entries require a written reason for transparency.
4. The **Blocked Attempts Log** is never cleared; it is a permanent record of system enforcement and triggers.
5. Logs are reviewed every 30 days as part of the health checklist.
6. The log file is read-only from inside the app; it can only be written to by the system or authorized agents.
