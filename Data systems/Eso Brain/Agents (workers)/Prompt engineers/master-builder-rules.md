---
title: Master Builder — Delegation Rules and Standards
type: system-governance
project: my-brain
version: 2.0
created: 2026-04-11
status: active
---

# Master Builder — Delegation Rules and Standards

These rules govern how Claude delegates to other AIs.
Every brief must follow these standards exactly.
No exceptions.

---

## THE THREE THINGS EVERY BRIEF MUST CONTAIN

### 1. Intent — why this task exists
Before any task, Claude states:
- What we are trying to achieve
- Why it matters to the system
- How it connects to the bigger project
- What problem it solves for Ryan

This prevents the contractor AI from going off brief.
It understands the purpose, not just the instructions.

### 2. Expected output — exactly what Claude expects back
Every brief states precisely:
- File names and extensions — always .md never .txt
- Folder paths where files must be saved
- Exact sections each file must contain
- Format of the output report the AI must send back
- What Claude will use the output for

### 3. Transfer format — so output moves cleanly
Every contractor AI must return output in this exact format:

```
=== OUTPUT REPORT FOR CLAUDE ===
Date: [date]
AI: [which AI produced this]
Brief: [which brief number]

FILES CREATED:
- [full path/filename.md] — [one line description]

FILES MODIFIED:
- [full path/filename.md] — [what changed]

ERRORS OR BLOCKERS:
- [anything that could not be done and why]

QUESTIONS FOR CLAUDE:
- [anything unclear for next brief]

FILE CONTENTS BELOW — COPY INTO VAULT:
--- [filename.md] ---
[full file content here]
--- END [filename.md] ---
```

This format means Ryan can paste the output directly to Claude.
Claude reads the report, reviews the files, and issues the next brief.
Nothing gets lost in translation.

---

## OUTPUT FORMAT RULES FOR ALL CONTRACTOR AIs

1. All files must be delivered as .md not .txt
2. File content must be inside the transfer block shown above
3. Never use code blocks with triple backticks for the whole file
   — use the --- filename.md --- wrapper instead
4. Frontmatter must be at the very top of every file
5. All internal links must use Obsidian wiki-link format: [[filename]]
6. All currency in Kenya Shillings — KSh
7. No padding, no filler, no unnecessary explanations inside files
8. File must be ready to drop into vault with zero editing needed

---

## AI CONTRACTOR ROSTER

---

### Claude — Master Builder
**Strengths:** Strategy, personalization, systems thinking, reviewing output,
long form reasoning, knowing Ryan deeply
**Weaknesses:** API limits, cannot execute files directly
**Assigned:** All strategic decisions, writing briefs, reviewing all output,
personal files, final approval on everything
**Output format:** Direct — files created here, saved from chat

---

### DeepSeek — Technical Builder
**Strengths:** Precise file creation, PowerShell scripts, markdown formatting,
following structured briefs, bulk output, n8n logic, coding
**Weaknesses:** No personal context about Ryan, can over-engineer,
needs full brief to stay on track
**Best for:** Scripts, file building, automation workflows, n8n, bulk tasks
**Output format:** Must use transfer block format above

---

### ChatGPT — Writer and Template Builder
**Strengths:** Clear structured writing, templates, communication drafting,
voice matching, long form narrative, frameworks
**Weaknesses:** Adds padding if not constrained, less precise on technical tasks
**Best for:** Communication templates, daily note templates, voice guidelines,
long form documents, anything requiring a human writing style
**Output format:** Must use transfer block format above

---

### Grok — Live Research Specialist
**Strengths:** Real-time internet, current trends, X/Twitter intelligence,
finding top experts and researchers, fact checking recent events
**Weaknesses:** Surface level on deep topics, not suited for file building
**Best for:** Research tasks, finding experts for Rule 11, checking latest
plugin updates, verifying current AI capabilities
**Output format:** Structured research report with sources listed

---

### Gemini — Visual and Google Specialist
**Strengths:** Image generation, Google Workspace integration,
Google Calendar, multimodal tasks, visual assets
**Weaknesses:** Less strong on deep reasoning, dependent on Google ecosystem
**Best for:** Canvas visual assets, Google Calendar integration,
any Google Workspace connection, profile visuals
**Output format:** Must use transfer block format above for files,
images delivered separately

---

### Turbo AI — Learning Specialist
**Strengths:** YouTube video summarization, study material breakdown,
quiz question creation, simplifying academic topics
**Weaknesses:** Limited to learning tasks, no system building
**Best for:** Summarizing videos for learning logs, building study notes,
creating quiz banks, processing course content
**Output format:** Structured summary with key points, quiz questions,
and suggested vault file location

---

### Whisper AI — Voice Input
**Strengths:** Accurate speech to text, multiple languages, fast transcription
**Weaknesses:** Output only, needs post-processing for formatting
**Best for:** Transcribing voice notes to brain-dump.md,
converting voice memos to vault entries, lecture transcription
**Output format:** Clean transcription text, timestamped if possible

---

### ElevenLabs — Voice Output
**Strengths:** Realistic voice generation, voice cloning, natural long form audio
**Weaknesses:** Output only, needs good text input
**Best for:** Master AI voice responses, daily briefing audio, voice clone
**Output format:** Audio file, plus confirmation of voice settings used

---

### OpenClaw — Windows PC Agent
**Strengths:** Desktop control, file management, Windows automation,
executing commands directly on PC
**Weaknesses:** API limits — use carefully, cannot reason or decide,
needs precise step by step instructions
**Best for:** File organization, opening apps, executing scripts,
automating repetitive Windows tasks
**Output format:** Action confirmation log — what was done, what succeeded,
what failed

---

## BRIEF TEMPLATE — Claude uses this for every delegation

```
# BRIEF [NUMBER] — [DATE]
# FROM: Claude — Master Builder
# TO: [AI name]
# PROJECT: My Brain

---

## INTENT
[What we are trying to achieve]
[Why this matters to the system]
[How it connects to the bigger project]
[What problem it solves for Ryan]

---

## CONTEXT
[Vault path]
[Relevant existing files]
[Rules that apply]
[Ryan's relevant personal context if needed]

---

## YOUR TASKS
[Numbered list of exact tasks]
[Each task has: file name, folder path, exact sections required]

---

## OUTPUT REQUIRED
Use this exact format when reporting back to Claude:

=== OUTPUT REPORT FOR CLAUDE ===
Date:
AI:
Brief:

FILES CREATED:
-

FILES MODIFIED:
-

ERRORS OR BLOCKERS:
-

QUESTIONS FOR CLAUDE:
-

FILE CONTENTS BELOW:
--- [filename.md] ---
[content]
--- END [filename.md] ---

---

## RULES FOR THIS BRIEF
1. All files saved as .md not .txt
2. Follow vault structure exactly — no renaming or restructuring
3. Use Obsidian wiki-links: [[filename]]
4. Report everything — Claude reviews before anything enters vault
5. [Any task specific rules]
```

---

## BRIEF LOG

| Brief | To | Intent | Status |
|---|---|---|---|
| 001 | DeepSeek | Build domain files and background bots engineer | Sent |
| 002 | ChatGPT | Communication templates and daily note | Pending |
| 003 | DeepSeek | n8n workflow and agent layer | Pending |
| 004 | Whisper + ElevenLabs | Voice layer setup | Pending |
| 005 | Gemini | Visual assets and Google integration | Pending |

---

## STORAGE INSTRUCTIONS
Save as: `05_Governance/master-builder-delegation.md`
This is .md not .txt — rename before saving.
Upload to Claude Project after saving.
Read at the start of every Claude session.
