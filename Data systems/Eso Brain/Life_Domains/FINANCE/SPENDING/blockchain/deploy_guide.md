# ECS — Solana Blockchain Deployment Guide
**Module:** Vault (90-Day Time-Lock) | **Framework:** Anchor (Rust)

---

## 1. Prerequisites (Run on Main Machine)

You need the following installed to deploy this system:
1. **Rust:** `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
2. **Solana CLI:** `sh -c "$(curl -sSfL https://release.solana.com/stable/install)"`
3. **Node.js & Yarn:** `npm install -g yarn`
4. **Anchor CLI:** `cargo install --git https://github.com/coral-xyz/anchor avm --locked --force` then `avm install latest` and `avm use latest`.

---

## 2. Setup your Wallet

If you don't have a local Solana wallet yet:
```bash
solana-keygen new --outfile ~/.config/solana/id.json
```
Ensure you have some SOL for deployment fees on Devnet first:
```bash
solana airdrop 2
```

---

## 3. Configure and Build

1. **Get your Program ID:**
   Run `anchor keys list`. It will output a public key.
2. **Update the code:**
   - Open `programs/ecs_vault/src/lib.rs` and replace `ECS_VAULT_PROGRAM_ID_PLACEHOLDER` with your key.
   - Open `Anchor.toml` and replace `ECS_VAULT_PROGRAM_ID_PLACEHOLDER` in both `localnet` and `mainnet` sections.
3. **Build:**
   ```bash
   anchor build
   ```

---

## 4. Deploy

Start with **Devnet** (Free testing):
```bash
anchor deploy --provider.cluster devnet
```

Once you are ready for **Mainnet** (Real money):
1. Switch `Anchor.toml` provider cluster to `mainnet`.
2. Run `anchor deploy`.

---

## 5. Interaction (How to lock money)

I will provide a separate script (`interaction.ts`) that you can run to trigger the `initialize_lock` function. You will need:
- The `escrow` account address (derived from your wallet).
- The USDC mint address on Mainnet: `EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v`.

---

## 6. Verification
After deployment, paste the **Program ID** back into `rules.json` to link the blockchain logic to the rest of the ECS system.

> [!CAUTION]
> **WARNING:** The 90-day lock is enforced by the Solana blockchain itself. There is NO "Admin" or "Backend" override. If you lock funds, they are physically inaccessible until the timestamp passes.
