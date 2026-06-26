# ECS System Alerts
Ryan acknowledges each alert by marking the status as **acknowledged**. Cleared alerts move to `spending/logs/alerts-archive.md`.

---

## Active Alerts
| ID | Date | Time | Type | Message | Status |
|---|---|---|---|---|---|
| 001 | 2026-04-20 | 14:30 | System Ready | System overhaul complete. Initializing buckets. | New |

---

## Alert Types
- **bucket empty**: Funds depleted.
- **bucket low**: Under 20% remaining.
- **vault deploying soon**: 24h reminder.
- **vault unlocking soon**: 90-day timer approaching zero.
- **emergency cooldown active**: 48h timer running.
- **giving reset due**: 30th of the month.
- **flex change pending**: 24h cooldown active.
- **blocked attempt detected**: Security event.
- **system error**: Critical failure.

---
**Protocol:** Alerts are auto-generated. Ryan acknowledges by marking status.
