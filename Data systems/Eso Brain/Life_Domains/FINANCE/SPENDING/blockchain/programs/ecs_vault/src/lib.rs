use anchor_lang::prelude::*;
use anchor_spl::token::{self, Mint, Token, TokenAccount, Transfer};

declare_id!("ECS_VAULT_PROGRAM_ID_PLACEHOLDER");

#[program]
pub mod ecs_vault {
    use super::*;

    /// Initialize a new 90-day time-lock for a specific amount of USDC
    pub fn initialize_lock(ctx: Context<InitializeLock>, amount: u64) -> Result<()> {
        let escrow = &mut ctx.accounts.escrow;
        let clock = Clock::get()?;

        escrow.owner = ctx.accounts.owner.key();
        escrow.mint = ctx.accounts.mint.key();
        escrow.vault = ctx.accounts.vault.key();
        escrow.amount = amount;
        escrow.unlock_timestamp = clock.unix_timestamp + (90 * 24 * 60 * 60); // 90 Days
        escrow.bump = *ctx.bumps.get("escrow").unwrap();

        // Transfer USDC from owner to the PDA-owned vault
        let cpi_accounts = Transfer {
            from: ctx.accounts.owner_token_account.to_account_info(),
            to: ctx.accounts.vault.to_account_info(),
            authority: ctx.accounts.owner.to_account_info(),
        };
        let cpi_program = ctx.accounts.token_program.to_account_info();
        let cpi_ctx = CpiContext::new(cpi_program, cpi_accounts);
        token::transfer(cpi_ctx, amount)?;

        Ok(())
    }

    /// Unlock and withdraw funds after the 90-day period
    pub fn withdraw(ctx: Context<Withdraw>) -> Result<()> {
        let escrow = &ctx.accounts.escrow;
        let clock = Clock::get()?;

        // 1. Enforcement: Check if 90 days have passed
        require!(
            clock.unix_timestamp >= escrow.unlock_timestamp,
            ErrorCode::LockNotExpired
        );

        // 2. CPI: Transfer USDC from vault back to owner
        let seeds = &[
            b"escrow",
            escrow.owner.as_ref(),
            &[escrow.bump],
        ];
        let signer = &[&seeds[..]];

        let cpi_accounts = Transfer {
            from: ctx.accounts.vault.to_account_info(),
            to: ctx.accounts.owner_token_account.to_account_info(),
            authority: ctx.accounts.escrow.to_account_info(), // PDA is the authority
        };
        let cpi_program = ctx.accounts.token_program.to_account_info();
        let cpi_ctx = CpiContext::new_with_signer(cpi_program, cpi_accounts, signer);
        token::transfer(cpi_ctx, escrow.amount)?;

        Ok(())
    }
}

#[derive(Accounts)]
pub struct InitializeLock<'info> {
    #[account(
        init,
        payer = owner,
        space = 8 + 32 + 32 + 32 + 8 + 8 + 1,
        seeds = [b"escrow", owner.key().as_ref()],
        bump
    )]
    pub escrow: Account<'info, TimeLockEscrow>,

    #[account(
        init,
        payer = owner,
        token::mint = mint,
        token::authority = escrow, // The PDA state account owns the vault tokens
    )]
    pub vault: Account<'info, TokenAccount>,

    pub mint: Account<'info, Mint>,

    #[account(mut)]
    pub owner: Signer<'info>,

    #[account(mut)]
    pub owner_token_account: Account<'info, TokenAccount>,

    pub system_program: Program<'info, System>,
    pub token_program: Program<'info, Token>,
    pub rent: Sysvar<'info, Rent>,
}

#[derive(Accounts)]
pub struct Withdraw<'info> {
    #[account(
        mut,
        close = owner,
        seeds = [b"escrow", owner.key().as_ref()],
        bump = escrow.bump,
        has_one = owner,
    )]
    pub escrow: Account<'info, TimeLockEscrow>,

    #[account(
        mut,
        constraint = vault.key() == escrow.vault
    )]
    pub vault: Account<'info, TokenAccount>,

    #[account(mut)]
    pub owner: Signer<'info>,

    #[account(mut)]
    pub owner_token_account: Account<'info, TokenAccount>,

    pub token_program: Program<'info, Token>,
}

#[account]
pub struct TimeLockEscrow {
    pub owner: Pubkey,
    pub mint: Pubkey,
    pub vault: Pubkey,
    pub amount: u64,
    pub unlock_timestamp: i64,
    pub bump: u8,
}

#[error_code]
pub enum ErrorCode {
    #[msg("The 90-day time-lock period has not yet expired.")]
    LockNotExpired,
}
