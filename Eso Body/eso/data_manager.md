# ESO Data Manager (The Worker)
**Status**: Planning / Logic Definition
**Purpose**: The automated "Hands" of the system. Manages file flow between the Dashboard, Inbox, and My Brain.

## I. File Permission Tiers
*This section defines what the Worker can and cannot touch.*

### Tier 1: Read/Write (Full Access)
- `C:\Users\KARANJA\Documents\Eso Body\eso\sessions\`
- `C:\Users\KARANJA\Documents\Eso Brain\_Inbox\`
- `C:\Users\KARANJA\Documents\Eso Brain\_Templates\`
- `C:\Users\KARANJA\Documents\Eso Body\eso\data\`

### Tier 2: Read-Only (Context Only)
- `01_Core_Self/`
- `02_Executive/`
- `05_Governance/`
- `architecture.md`

### Tier 3: Off-Limits (No Access)
- *[Reserved for sensitive personal data to be defined by User]*

---

## II. Operational Protocols (To be refined)
1. **The Hand-off**: Automatically generate a `session_summary.md` after every session.
2. **The Clean-up**: Scan `_Inbox` for new files automatically (every 10 min) and propose categorization to the Dashboard.
3. **The Hybrid Filter**: 
   - **Receiving Data**: Fully Automatic. The Worker is always watching.
   - **Writing/Moving Data**: Manual Approval. The Worker presents the data; the User hits "Approve" before any folder is changed.
4. **The Notification Protocol**: 
   - **Low Priority data** (Logs, status updates): Silent. Updates only reflective on the Dashboard.
   - **High Priority data** (New Inbox items, Conflicts, Approvals): Desktop notification + Dashboard badge.
   - **Emergency/Critical data**: Immediate Desktop sound/popup.
5. **The Duplicate Protocol**: If two files share a name, the Worker must display both contents side-by-side. The User will choose to:
   - Merge them.
   - Re-summarize and merge.
   - Delete one.
6. **The Mirror**: Sync Dashboard "Next Actions" with Obsidian "Action Manager."

---

## III. Active Questions for the User
1. **Approval**: Always wait for final "OK" before moving/deleting files. (Answer: Consultative)
2. **Duplicates**: Show contents of both; User chooses action. (Answer: Side-by-side Review)
3. **Trigger**: Automatic receiving (Timer); Manual approval (Buttons). (Answer: Hybrid Sync)
4. **Integration**: Tiered notifications (Silent vs. Active). (Answer: Priority-based Apps/Alerts)
5. **Safety**: Hard stop on unusual activity; Report → Detect → Stop → Suggest. (Answer: Failsafe Lockdown)
