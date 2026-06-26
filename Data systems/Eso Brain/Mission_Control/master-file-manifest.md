---
title: Master File Manifest
type: system-governance
project: my-brain
version: 1.0
created: 2026-04-11
status: active
---

# Master File Manifest

This file lists every file in the system.
Path, purpose, status, and hosting location.
Run the health check script to verify all files exist.

---

## HOSTING LEGEND
LOCAL = sensitive, never leaves PC
CLOUD = backed up to cloud (Google Drive or similar)
BOTH = local primary, cloud backup

---

## ROOT LEVEL
| File | Path | Status | Hosting |
|---|---|---|---|
| Personal constitution | My Brain/personal-constitution.md | DONE | LOCAL |
| Brain dump | My Brain/brain-dump.md | DONE | LOCAL |

---

## 01_Core_Self
| File | Path | Status | Hosting |
|---|---|---|---|
| Personal constitution | 01_Core_Self/personal-constitution.md | DONE | LOCAL |
| Master AI profile | 01_Core_Self/master-ai-profile.md | DONE | LOCAL |
| Birth chart | 01_Core_Self/birth-chart.md | MISSING | LOCAL |
| Vision 2034 | 01_Core_Self/vision-2034.md | MISSING | LOCAL |
| Growth and hobbies | 01_Core_Self/Growth & Hobbies.md | EXISTS | LOCAL |
| The Actor | 01_Core_Self/The Actor.md | EXISTS | LOCAL |
| Tools | 01_Core_Self/Tools.md | EXISTS | LOCAL |

---

## 02_Executive
| File | Path | Status | Hosting |
|---|---|---|---|
| Master AI system prompt | 02_Executive/master-ai-system-prompt.md | DONE | LOCAL |
| Ryan voice guidelines | 02_Executive/ryan-voice-guidelines.md | DONE | LOCAL |
| Communication templates | 02_Executive/communication-templates.md | DONE | LOCAL |
| Emergency protocols | 02_Executive/Emergency Protocols.md | EXISTS | LOCAL |
| Emotional friend protocol | 02_Executive/Emotional Friend Protocol.md | EXISTS | LOCAL |
| Jarvis assistant | 02_Executive/Jarvis Assistant.md | EXISTS | LOCAL |
| Multi-modal IO | 02_Executive/Multi-Modal IO.md | EXISTS | LOCAL |

---

## 03_Memory
| File | Path | Status | Hosting |
|---|---|---|---|
| Backups and versioning | 03_Memory/Backups & Versioning.md | EXISTS | BOTH |
| Segmented memory | 03_Memory/Segmented Memory.md | EXISTS | LOCAL |
| Master AI architecture | 03_Memory/master-ai-architecture.md | MISSING | LOCAL |
| n8n workflow 00 | 03_Memory/n8n-workflows/00-master-ai-workflow.json | READY TO SAVE | LOCAL |
| n8n workflow 01 | 03_Memory/n8n-workflows/01-backup-reminder.json | READY TO SAVE | LOCAL |
| n8n workflow 02 | 03_Memory/n8n-workflows/02-file-change-logger.json | READY TO SAVE | LOCAL |
| n8n workflow 03 | 03_Memory/n8n-workflows/03-daily-briefing.json | READY TO SAVE | LOCAL |
| n8n workflow 04 | 03_Memory/n8n-workflows/04-boredom-detector.json | READY TO SAVE | LOCAL |
| n8n workflow 05 | 03_Memory/n8n-workflows/05-brain-dump-sorter.json | READY TO SAVE | LOCAL |

---

## 04_Agents
| File | Path | Status | Hosting |
|---|---|---|---|
| AI tools directory | 04_Agents/ai-tools-directory.md | DONE | BOTH |
| Agent executor engineer | 04_Agents/agent-executor-engineer.md | DONE | LOCAL |
| Learning quiz engineer | 04_Agents/learning-quiz-engineer.md | DONE | LOCAL |
| Normal prompt engineer | 04_Agents/normal-prompt-engineer.md | DONE | LOCAL |
| Project builder engineer | 04_Agents/project-builder-engineer.md | DONE | LOCAL |
| Background bots engineer | 04_Agents/background-bots-engineer.md | DONE | LOCAL |
| AI network | 04_Agents/AI Network.md | EXISTS | BOTH |
| Specialized agents | 04_Agents/Specialized Agents.md | EXISTS | LOCAL |
| Tools and AI directory | 04_Agents/tools-and-ai-directory.md | MISSING | BOTH |

---

## 05_Governance
| File | Path | Status | Hosting |
|---|---|---|---|
| Prompt engineer rules | 05_Governance/prompt-engineer-rules.md | DONE | LOCAL |
| Master builder delegation | 05_Governance/master-builder-delegation.md | DONE | LOCAL |
| Authorization and security | 05_Governance/Authorization & Security.md | EXISTS | LOCAL |
| Hierarchical rules | 05_Governance/Hierarchical Rules.md | EXISTS | LOCAL |

---

## 06_Mission_Control
| File | Path | Status | Hosting |
|---|---|---|---|
| Project checklist | 06_Mission_Control/project-checklist.md | DONE | BOTH |
| Parallel workflow | 06_Mission_Control/parallel-workflow.md | DONE | BOTH |
| Smart connections setup | 06_Mission_Control/smart-connections-setup.md | DONE | BOTH |
| VS Code vault setup | 06_Mission_Control/vscode-vault-setup.md | DONE | BOTH |
| Antigravity setup | 06_Mission_Control/antigravity-setup.md | DONE | BOTH |
| Messaging integration | 06_Mission_Control/messaging-integration.md | DONE | BOTH |
| Action manager | 06_Mission_Control/Action Manager.md | EXISTS | BOTH |
| Changeable rigid parts | 06_Mission_Control/Changable Rigid Parts.md | EXISTS | BOTH |
| Progress and reviews | 06_Mission_Control/Progress & Reviews.md | EXISTS | BOTH |
| DeepSeek brief 001 | 06_Mission_Control/deepseek-brief-001.md | DONE | BOTH |
| DeepSeek brief 002 | 06_Mission_Control/deepseek-brief-002.md | DONE | BOTH |
| DeepSeek brief 003 | 06_Mission_Control/deepseek-brief-003.md | DONE | BOTH |
| ChatGPT brief 001 | 06_Mission_Control/chatgpt-brief-001.md | DONE | BOTH |
| ChatGPT brief 002 | 06_Mission_Control/chatgpt-brief-002.md | DONE | BOTH |

---

## 07_Life_Domains
| File | Path | Status | Hosting |
|---|---|---|---|
| Finance | 07_Life_Domains/finance.md | DONE | LOCAL |
| Health | 07_Life_Domains/health.md | DONE | LOCAL |
| Family | 07_Life_Domains/family.md | DONE | LOCAL |
| Spirituality | 07_Life_Domains/spirituality.md | DONE | LOCAL |
| Body | 07_Life_Domains/body.md | DONE | LOCAL |
| Domain automations | 07_Life_Domains/Domain Automations.md | EXISTS | LOCAL |
| Project handlers | 07_Life_Domains/Project Handlers.md | EXISTS | LOCAL |
| To-dos and must-dos | 07_Life_Domains/To-Dos & Must-Dos.md | EXISTS | LOCAL |

---

## _Templates
| File | Path | Status | Hosting |
|---|---|---|---|
| Component template | _Templates/Component Template.md | EXISTS | BOTH |
| Daily note | _Templates/Daily note.md | EXISTS | BOTH |
| Daily note improved | _Templates/daily-note-improved.md | READY TO SAVE | BOTH |
| Project template | _Templates/Project.md | EXISTS | BOTH |
| Ollama verify script | _Templates/scripts/ollama-verify.ps1 | READY TO SAVE | LOCAL |
| Git setup script | _Templates/scripts/git-setup.ps1 | READY TO SAVE | LOCAL |
| Git auto commit script | _Templates/scripts/git-auto-commit.ps1 | CREATED BY GIT SETUP | LOCAL |

---

## _Inbox
| File | Path | Status | Hosting |
|---|---|---|---|
| Universal inbox | _Inbox/Universal Inbox.md | EXISTS | LOCAL |
| Sorting suggestions | _Inbox/sorting-suggestions.md | AUTO-CREATED BY N8N | LOCAL |

---

## logs
| File | Path | Status | Hosting |
|---|---|---|---|
| Action log | logs/action-log.md | DONE | LOCAL |
| Session log | logs/session-log.md | AUTO-CREATED BY N8N | LOCAL |

---

## chats (NEW FOLDER)
| File | Path | Status | Hosting |
|---|---|---|---|
| Chat log template | chats/chat-log-template.md | MISSING | BOTH |
| Claude session 2026-04-11 | chats/2026-04-11-claude-session-001.md | MISSING | BOTH |

---

## MISSING FILES SUMMARY
These need to be created:
1. 01_Core_Self/birth-chart.md
2. 01_Core_Self/vision-2034.md
3. 03_Memory/master-ai-architecture.md
4. 04_Agents/tools-and-ai-directory.md
5. chats/ folder and template
6. chats/2026-04-11-claude-session-001.md
7. All n8n JSON files need to be saved from briefs

---

## Storage instructions
Save as: 06_Mission_Control/master-file-manifest.md
Run health-check.ps1 to verify all files exist.
Update status column when files are created.