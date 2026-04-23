const path = require('path');
const { getEnv } = require('./environment');

const env = getEnv();

/**
 * ESO SOVEREIGN OS // INBOX_CLEANER.JS v2.1
 * -----------------------------------------
 * HYBRID MODE: Auto-creates core domains, skips complex trackers.
 * -----------------------------------------
 */

// CONFIGURATION
const VAULT_ROOT = path.join(env.base, 'Eso Brain');
const PROJECT_ROOT = path.join(env.base, 'Eso Body', 'eso');
const INBOX_FILE = path.join(VAULT_ROOT, '_Inbox', 'Universal Inbox.md');
const BACKUP_FILE = path.join(VAULT_ROOT, '_Inbox', 'Universal Inbox.backup.md');
const LOG_FILE = path.join(PROJECT_ROOT, 'logs', 'inbox-cleaner.log');

const AUTO_CREATE_LIST = ['health.md', 'finance.md', 'family.md'];

const KEYWORD_MAP = [
    { regex: /health|workout|sleep|gym|water|meal/i, target: '07_Life_Domains/health.md' },
    { regex: /finance|budget|ksh|money|save|spend|invest/i, target: '07_Life_Domains/finance.md' },
    { regex: /family|parent|sibling|brother|sister|mom|dad/i, target: '07_Life_Domains/family.md' },
    { regex: /project|goal|deadline|milestone/i, target: '06_Mission_Control/Action Manager.md' },
    { regex: /idea|thought|note/i, target: '03_Memory/Segmented Memory.md' },
    { regex: /.*/i, target: '_Inbox/Uncategorized.md' } // Default
];

// ARGS
const isDryRun = process.argv.includes('--dry-run');
const isForce = process.argv.includes('--force');

function log(msg) {
    const timestamp = new Date().toISOString().replace('T', ' ').slice(0, 19);
    const entry = `[${timestamp}] ${msg}\n`;
    console.log(msg);
    if (!isDryRun) {
        if (!fs.existsSync(path.dirname(LOG_FILE))) fs.mkdirSync(path.dirname(LOG_FILE), { recursive: true });
        fs.appendFileSync(LOG_FILE, entry);
    }
}

async function start() {
    log(`🧹 INBOX_CLEANER_V2.1 HYBRID_MODE STARTED ${isDryRun ? '(DRY_RUN)' : ''}`);

    if (!fs.existsSync(INBOX_FILE)) {
        log(`❌ ERROR: Inbox not found at ${INBOX_FILE}`);
        return;
    }

    // 1. BACKUP
    if (!isDryRun) {
        fs.copyFileSync(INBOX_FILE, BACKUP_FILE);
        log(`🛡️ BACKUP_CREATED: ${path.basename(BACKUP_FILE)}`);
    }

    // 2. READ AND PARSE
    const content = fs.readFileSync(INBOX_FILE, 'utf8');
    const lines = content.split('\n');

    let otherLines = [];
    let inActive = false;
    let entriesToProcess = [];

    lines.forEach(line => {
        if (line.includes('## 🔴 Active')) { inActive = true; otherLines.push(line); return; }
        if (inActive && line.startsWith('##')) { inActive = false; }

        if (inActive && line.trim().startsWith('- ')) {
            entriesToProcess.push(line);
        } else {
            otherLines.push(line);
        }
    });

    if (entriesToProcess.length === 0) {
        log("✅ SUCCESS: INBOX_CLEAN; NO_ENTRIES_FOR_PROCESSING");
        return;
    }

    log(`📂 DETECTED: ${entriesToProcess.length} entries for sorting.`);

    // 3. SORT AND EXECUTE
    let movedEntries = [];

    for (const entry of entriesToProcess) {
        let targetFile = '';
        for (const rule of KEYWORD_MAP) {
            if (rule.regex.test(entry)) {
                targetFile = rule.target;
                break;
            }
        }

        const targetPath = path.join(VAULT_ROOT, targetFile);
        const fileName = path.basename(targetFile);
        const isAutoCreate = AUTO_CREATE_LIST.includes(fileName);

        if (!fs.existsSync(targetPath)) {
            if (isAutoCreate) {
                if (!isDryRun) {
                    if (!fs.existsSync(path.dirname(targetPath))) fs.mkdirSync(path.dirname(targetPath), { recursive: true });
                    const frontmatter = `---\ntype: domain\nstatus: active\nlast_updated: ${new Date().toISOString().split('T')[0]}\n---\n\n# ${fileName.replace('.md', '').toUpperCase()}\n\n## 📥 Inbox Imports\n`;
                    fs.writeFileSync(targetPath, frontmatter);
                }
                log(`✨ AUTO_CREATED: ${targetFile}`);
            } else {
                log(`⚠️ SKIPPED: ${targetFile} missing (Not in auto-create list). Entry remains in Active.`);
                continue;
            }
        }

        // Move the item
        if (!isDryRun) {
            let targetContent = fs.readFileSync(targetPath, 'utf8');
            if (!targetContent.includes('## 📥 Inbox Imports')) {
                targetContent += `\n\n## 📥 Inbox Imports\n`;
            }
            targetContent = targetContent.replace('## 📥 Inbox Imports', `## 📥 Inbox Imports\n${entry}`);
            fs.writeFileSync(targetPath, targetContent);
            log(`✅ MOVED: "${entry.trim()}" → ${targetFile}`);
        } else {
            log(`👀 PREVIEW: "${entry.trim()}" → ${targetFile}`);
        }
        movedEntries.push(entry);
    }

    // 4. UPDATE INBOX
    if (!isDryRun && movedEntries.length > 0) {
        const processedIndex = otherLines.findIndex(l => l.includes('## ✅ Processed'));
        if (processedIndex !== -1) {
            otherLines.splice(processedIndex + 1, 0, ...movedEntries);
        } else {
            otherLines.push('\n## ✅ Processed');
            otherLines.push(...movedEntries);
        }
        fs.writeFileSync(INBOX_FILE, otherLines.join('\n'));
        log(`📉 INBOX_UPDATED: ${movedEntries.length} items moved to Processed secondary header.`);
    }

    log(`🏁 SUMMARY: [MOVED] ${movedEntries.length} entries.`);
    if (isDryRun) log(`⚠️ THIS WAS A PREVIEW. No files were modified.`);
}

start();
