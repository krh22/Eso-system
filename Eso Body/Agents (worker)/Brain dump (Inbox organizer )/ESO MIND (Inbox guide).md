# ESO MIND (Inbox guide)

## What it is
The Universal Inbox is a single, central markdown file where you can dump your thoughts, tasks, and ideas out of your head. An AI system (Ollama/tinyllama via n8n) will automatically sort everything into the correct domain files and project checklists.

## Where it lives
Location: `C:\Users\PC\Documents\Eso Brain\04_Agents\Brain Dump\Universal Inbox.md`

## Keywords Table
Use these keywords to help guide the AI on what each entry is:

| Keyword | What it creates |
|---------|-----------------|
| `TODO` / `TASK` | Creates a task in your project checklist |
| `NOTE` / `THINK` | Creates a general thought or note |
| `REMIND AT` | Creates a reminder with a specific time |
| `LOG` / `DID` | Creates a record of something that happened |
| `IDEA` / `WHAT IF`| Creates a new idea entry in ideas.md |
| `GOAL` / `WANT` | Creates a goal or aspiration |
| `FEEL` / `MOOD` | Creates a log of your emotional state |

## What happens after you write (5-step process)
1. **Write**: Dump your RAW entries in the `Universal Inbox.md`.
2. **Watch**: n8n detects changes and reads the file for new, unsorted entries.
3. **Classify**: The entries are sent to the local Ollama (tinyllama) instance for categorization.
4. **Route**: The AI structures the data (JSON) and writes the entry to the correct domain or checklist file.
5. **Log**: n8n tags the original entry as `[SORTED]` and appends a record of the transaction to `inbox-change-log.md` and system logs.

## Secondary PC Rules
- You can write freely to your `Universal Inbox.md` on any secondary PC without worrying about the AI or automation running.
- The next time you are on your **Main PC** with n8n active, the watcher will simply catch up and automatically sort all the pending entries in the inbox.

## Files managed/created by the inbox system
1. `Universal Inbox.md` (The source file)
2. `Project Checklists` (For TODOs)
3. `Domain Files` (Ideas, notes, logs routed by category)
4. `ideas.md` 
5. `goals.md`
6. `inbox-change-log.md`
7. System logs
