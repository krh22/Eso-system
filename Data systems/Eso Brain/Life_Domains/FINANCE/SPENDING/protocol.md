# ECS Operational Protocol
This file contains the emergency and recovery instructions. It is written once and rarely changed. Never delete this file.

---

## Section 1 — What to do if you need emergency funds
1. Open the ECS App/Dashboard.
2. Go to the **Emergency** bucket.
3. Request a release.
4. Write your reason clearly in the log.
5. Wait **48 hours**. 
6. Do not try to shortcut this. The delay is the protection.

## Section 2 — What to do if Solana is down
Your money is safe on the blockchain. The network being down does not affect your funds. 
- Wait for network recovery.
- Check [status.solana.com](https://status.solana.com).
- Do not panic. You cannot lose access to your vaulted funds even if the RPC is down.

## Section 3 — What to do if you lose access to this system
1. Go to `Ryan. readme/FINANCE/`.
2. Open `FINANCE (Handover).md`.
3. Copy the **AI continuation prompt**.
4. Paste into any AI. It will rebuild the context fully.

## Section 4 — What to do if an AI dies mid-session
1. Open `FINANCE (Handover).md`.
2. Fill in the **Mid-Session Handover Instructions** (Section 7) manually.
3. Save the file.
4. Start a new AI session and paste the updated handover prompt.

## Section 5 — What Ryan must never do
- **Never share private keys digitally.**
- **Never send vault money to anyone.**
- **Never try to override a time lock.**
- **Never borrow from food or rent buckets.**
- **Never treat extra income as free spending money.**

## Section 6 — Deployment instructions for main machine
1. Copy the entire `FINANCE/` folder to the main machine.
2. Open `FINANCE (Paths).md` and verify all files are present.
3. Open `FINANCE (Handover).md` and update the machine field to "Main machine".
4. Open `rules.json` and fill in your Solana wallet address.
5. Test `calculator.html` by entering a deposit and confirming allocations.
6. The system is live.
