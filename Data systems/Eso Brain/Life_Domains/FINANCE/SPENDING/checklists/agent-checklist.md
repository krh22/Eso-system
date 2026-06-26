# Agent Checklist — ECS Spending Module

**Purpose:** Every agent action must follow this checklist in order. No steps can be skipped.

---

## On Every Deposit Received

- [ ] Check which layer is triggered: Layer 1 if total monthly income is under 12000, Layer 2 if above.
- [ ] Calculate all bucket allocations using `rules.json`.
- [ ] Write allocation to `log.md` allocation log.
- [ ] Deploy vault percentage to Solana smart contract immediately.
- [ ] Deduct fee buffer before vault deployment.
- [ ] Update all bucket balances in system state inside `rules.json`.
- [ ] Check if giving reset date has passed and reset if yes.
- [ ] Write deposit entry to `log.md` deposit log.
- [ ] Send confirmation summary to dashboard.

## On Every Spending Request

- [ ] Check bucket name being requested.
- [ ] Check current bucket balance in `rules.json`.
- [ ] If balance is zero, block the transaction and write to blocked attempts log.
- [ ] If transaction is above manual approval threshold, flag for Ryan approval.
- [ ] If transaction is approved, deduct from bucket balance in `rules.json`.
- [ ] Write entry to spending log in `log.md`.
- [ ] Update system state totals.
- [ ] Send updated balance to dashboard.

## On Every Emergency Release Request

- [ ] Check emergency bucket balance.
- [ ] Log the request immediately in emergency release log.
- [ ] Start 48-hour cooldown timer.
- [ ] After 48 hours, check if request is still active.
  - [ ] If yes, release funds and update balance.
  - [ ] If no, cancel and log cancellation.
- [ ] Write result to `log.md`.

## On Every Flexible Value Change Request

- [ ] Log the change request in bucket change log immediately.
- [ ] Start 24-hour cooldown.
- [ ] After 24 hours, apply new value to `rules.json`.
- [ ] Write completion to `log.md`.
- [ ] Never apply change before cooldown expires.

## On Every Vault Deployment

- [ ] Convert KES amount to USDC using current exchange rate.
- [ ] Deduct fee buffer.
- [ ] Send USDC to Solana smart contract.
- [ ] Record transaction ID, unlock date, and amount in vault deployment log.
- [ ] Update vault balance in system state.
- [ ] Confirm deployment on dashboard.

## On Every Monthly Reset

- [ ] Check giving bucket and reset to starting balance.
- [ ] Check buffer and rollover bucket and move excess to vault or next month.
- [ ] Generate monthly summary report.
- [ ] Write system event to `log.md`.
- [ ] Update giving reset date in system state.
