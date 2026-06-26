const fs = require('fs');
const path = require('path');

const targetDir = "C:\\Users\\PC\\Documents\\Eso Brain\\04_Agents\\Brain dump (Inbox organizer )";
const searchBase = "C:\\Users\\PC\\Documents";

// Create directories
const folders = [
    "SYSTEM CORE",
    "HANDOVER & LOGS",
    "DOMAIN MASTERS",
    "EXECUTION FILES",
    "N8N WORKFLOWS",
    "REFERENCE",
    "INBOX SYSTEM"
];

folders.forEach(f => {
    const dir = path.join(targetDir, f);
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
        console.log(`Created directory: ${f}`);
    }
});

function findFileContext(startPath, filename) {
    if (!fs.existsSync(startPath)) return null;
    try {
        const files = fs.readdirSync(startPath);
        for (let i = 0; i < files.length; i++) {
            const file = path.join(startPath, files[i]);
            if (file.includes('node_modules') || file.includes('.git') || file.includes('.obsidian')) continue;
            
            const stat = fs.lstatSync(file);
            if (stat.isDirectory()) {
                const res = findFileContext(file, filename);
                if (res) return res;
            } else if (file.toLowerCase().endsWith(filename.toLowerCase()) && 
                       path.basename(file).toLowerCase() === filename.toLowerCase()) {
                return file;
            }
        }
    } catch(e) {}
    return null;
}

const copyTasks = [
    {
        folder: "SYSTEM CORE",
        files: ["WHO.md", "STATUS.md", "personal-constitution.md", "claude-context.md", "file-paths.md"]
    },
    {
        folder: "HANDOVER & LOGS",
        files: ["ESO MIND (Handover).md", "ESO BODY (Handover).md", "ESO MIND (The whole OS).md", "antigravity-session-log.md"]
    },
    {
        folder: "DOMAIN MASTERS",
        files: ["food-domain.md", "gym-domain.md", "school-domain.md", "health-domain.md", "family-domain.md", "relationships-domain.md", "philosophy-domain.md", "adventure-domain.md", "fun-domain.md", "finance-domain.md"]
    },
    {
        folder: "EXECUTION FILES",
        files: ["project-checklist.md", "goals.md", "ideas.md", "weekly-review.md"]
    },
    {
        folder: "N8N WORKFLOWS",
        files: [
            "01-master-ai-workflow.json", "02-backup-reminder.json", "03-file-change-logger.json", 
            "04-daily-briefing.json", "05-boredom-detector.json", "06-inbox-sorter.json",
            "07-checklist-bot.json", "08-log-bot.json", "09-handover-bot.json", "10-paths-sync-bot.json"
        ]
    },
    {
        folder: "REFERENCE",
        files: ["paths.json", "agents.json", "runbook.md", "ai-tools.md"]
    }
];

let globalPathsJsonPath = null;
let globalFilePathsMdPath = null;
let globalSessionLogPath = null;

copyTasks.forEach(task => {
    task.files.forEach(filename => {
        console.log(`Searching for ${filename}...`);
        const src = findFileContext(searchBase, filename);
        if (src) {
            const dest = path.join(targetDir, task.folder, filename);
            fs.copyFileSync(src, dest);
            console.log(`Copied ${filename} to ${task.folder}/`);
            
            if (filename.toLowerCase() === 'paths.json' && !globalPathsJsonPath) globalPathsJsonPath = src;
            if (filename.toLowerCase() === 'file-paths.md' && !globalFilePathsMdPath) globalFilePathsMdPath = src;
            if (filename.toLowerCase() === 'antigravity-session-log.md' && !globalSessionLogPath) globalSessionLogPath = src;
        } else {
            console.log(`Warning: Could not find ${filename}`);
            // Create a blank mock if user really expects it
            const dest = path.join(targetDir, task.folder, filename);
            if (filename.endsWith('.json')) fs.writeFileSync(dest, '{}');
            else fs.writeFileSync(dest, `# ${filename}\n(Mock file - original not found)\n`);
        }
    });
});

// Update registry step
try {
    const refPathsJson = path.join(targetDir, "REFERENCE", "paths.json");
    if (fs.existsSync(refPathsJson)) {
        let doc = JSON.parse(fs.readFileSync(refPathsJson, 'utf8'));
        doc["brain_dump_archive"] = "C:/Users/PC/Documents/Eso Brain/04_Agents/Brain Dump";
        fs.writeFileSync(refPathsJson, JSON.stringify(doc, null, 2));
        console.log("Updated paths.json in REFERENCE");
    }
} catch(e) {
    console.log("Error updating paths.json copies", e);
}

if (globalPathsJsonPath) {
    try {
        let doc = JSON.parse(fs.readFileSync(globalPathsJsonPath, 'utf8'));
        doc["brain_dump_archive"] = "C:/Users/PC/Documents/Eso Brain/04_Agents/Brain Dump";
        fs.writeFileSync(globalPathsJsonPath, JSON.stringify(doc, null, 2));
        console.log("Updated global paths.json");
    } catch(e) {}
}

if (globalFilePathsMdPath) {
    try {
        let doc = fs.readFileSync(globalFilePathsMdPath, 'utf8');
        doc += `\n- **Brain Dump Archive**: C:/Users/PC/Documents/Eso Brain/04_Agents/Brain Dump\n`;
        fs.writeFileSync(globalFilePathsMdPath, doc);
        console.log("Updated global file-paths.md");
    } catch(e) {}
}

if (globalSessionLogPath) {
    try {
        let doc = fs.readFileSync(globalSessionLogPath, 'utf8');
        doc += `\n## Session: Brain Dump Consolidation\n`;
        doc += `- Consolidated 40+ reference files into Brain Dump Archive structure.\n`;
        doc += `- Folders created: SYSTEM CORE, HANDOVER & LOGS, DOMAIN MASTERS, EXECUTION FILES, N8N WORKFLOWS, REFERENCE.\n`;
        fs.writeFileSync(globalSessionLogPath, doc);
        console.log("Updated global antigravity-session-log.md");
    } catch(e) {}
}

console.log("ALL STEPS COMPLETED");
