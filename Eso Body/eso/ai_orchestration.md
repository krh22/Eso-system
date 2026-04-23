# ESO AI Orchestration Guide
**Purpose**: How to use your AI network to move fast while you think slow.

## 1. The Team Roster
| AI Tool | Primary Strength | Use When... |
|---|---|---|
| **Claude (Brain)** | Strategy, Architecture, Planing | You need to decide *what* to build next. |
| **Antigravity (Engine)** | Local Code, Terminal, Automation | You need to build files, run scripts, or organize data locally. |
| **DeepSeek (Specialist)**| Complex Coding, Debugging | Claude hits his limit and you need high-level code help. |
| **Grok (Eyes)** | Real-time Search, Social Trends | You need a "pulse" on what is happening right now in the world. |
| **ChatGPT/Gemini (Support)**| General logic, spikes, Multimodal | You need a quick answer or to process long documents/images. |

---

## 2. The Persistence Protocol (Handling Limits)
When an AI (like Gemini 3 Flash or Claude) hits its limit:

1. **Write the Session Log**: Stop what you are doing. Summarize the progress in `Project/eso/sessions/session_log.md`.
2. **Move the Bridge**: Upload `architecture.md` and the `session_log.md` to the next AI.
3. **Execute**: Continue the work. When the original AI's limit resets, bring the summary back.

---

## 3. The "Human in the Loop" Rule
The computers move fast; you move slow.
- **NEVER** let an AI delete files without you reading the command first.
- **NEVER** assume an AI remembers a previous session. Always feed it the `session_log.md`.
- **ALWAYS** check the "Life Balance" dashboard before starting a 4+ hour AI sprint.

---

## 4. Automation Protocol (For Antigravity)
- Antigravity will build **background scripts** that monitor your `My Brain` vault.
- These scripts will generate "Briefing Packages" in the `/eso/sessions` folder so you have a fresh start every morning.
