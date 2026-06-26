const path = require('path');
const { getEnv } = require('./environment');

const env = getEnv();

// Configuration
const BASE_DIR = path.join(__dirname, '..');
const BRAIN_DIR = path.join(env.base, 'Eso Brain');
const SESSIONS_DIR = path.join(BASE_DIR, 'sessions');
const CHECKLIST_FILE = path.join(BRAIN_DIR, '06_Mission_Control', 'project-checklist-v2.3.md');
const INBOX_FILE = path.join(BRAIN_DIR, '_Inbox', 'Universal Inbox.md');
const ARCH_FILE = path.join(BASE_DIR, 'architecture.md');
const DATA_MANAGER_FILE = path.join(BASE_DIR, 'data_manager.md');
const OUTPUT_FILE = path.join(SESSIONS_DIR, 'current_handoff.txt');
const DASHBOARD_FILE = path.join(BASE_DIR, 'dashboard', 'eso_v3_futuristic.html');

function parseChecklist() {
    if (!fs.existsSync(CHECKLIST_FILE)) return { tasks: [], stats: [] };
    const content = fs.readFileSync(CHECKLIST_FILE, 'utf8');
    const lines = content.split('\n');
    let tasks = [];
    let stats = [];
    let currentPhase = "";
    let phaseTotal = 0;
    let phaseDone = 0;

    lines.forEach(line => {
        if (line.startsWith('## PHASE') || line.startsWith('### PHASE')) {
            if (currentPhase) {
                stats.push({ name: currentPhase, p: Math.round((phaseDone / phaseTotal) * 100) || 0 });
            }
            currentPhase = line.replace(/##+|#/g, '').trim();
            phaseTotal = 0;
            phaseDone = 0;
        }

        if (line.includes('- [ ]') || line.includes('- [x]')) {
            phaseTotal++;
            if (line.includes('- [x]')) phaseDone++;

            if (line.includes('- [ ]')) {
                const text = line.replace('- [ ]', '').trim();
                const priority = text.includes('!!') ? 'urgent' : 'normal';
                tasks.push({ text, priority });
            }
        }
    });
    if (currentPhase) stats.push({ name: currentPhase, p: Math.round((phaseDone / phaseTotal) * 100) || 0 });

    return { tasks, stats };
}

function parseInbox() {
    if (!fs.existsSync(INBOX_FILE)) return "INBOX_NOT_FOUND";
    const content = fs.readFileSync(INBOX_FILE, 'utf8');
    const activeSection = content.split('## 🔴 Active')[1]?.split('##')[0] || "";
    return activeSection.trim() || "INBOX_EMPTY";
}

function updateDashboard(context, tasks, stats, inbox) {
    if (!fs.existsSync(DASHBOARD_FILE)) return;
    let html = fs.readFileSync(DASHBOARD_FILE, 'utf8');

    // Inject Context into side panel
    const ctxRegex = /(<div class="term-b bridge-pre" id="bridge-text">)([\s\S]*?)(<\/div>)/;
    html = html.replace(ctxRegex, `$1${context}$3`);

    // Inject Inbox Preview
    const inboxRegex = /(<div id="inbox-preview" class="card" style="font-size:11px; color:#555;">)([\s\S]*?)(<\/div>)/;
    html = html.replace(inboxRegex, `$1${inbox.replace(/\n/g, '<br>')}$3`);

    // Hydrate JS
    const dataRegex = /(let S = )([\s\S]*?)(;)/;
    const newData = {
        intel: tasks.slice(0, 30),
        stats: stats.slice(0, 12),
        logs: [],
        dumps: [],
        rules: ["Logic over Emotion", "Log or it didn't happen", "Cleaner Active"]
    };
    html = html.replace(dataRegex, `$1${JSON.stringify(newData)}$3`);

    fs.writeFileSync(DASHBOARD_FILE, html);
}

function generateBridge() {
    console.log("🏙️ BUILDING_SOVEREIGN_HANDOFF...");

    try {
        const { tasks, stats } = parseChecklist();
        const inbox = parseInbox();
        const arch = fs.readFileSync(ARCH_FILE, 'utf8');
        const man = fs.readFileSync(DATA_MANAGER_FILE, 'utf8');

        const fullContext = `
# ESO // UNIVERSAL_CONTEXT_REPORT // ${new Date().toLocaleString()}
=====================================================
# 1. ARCHITECTURE
${arch}
=====================================================
# 2. INBOX_STATUS
${inbox}
=====================================================
# 3. MISSION_STATUS
${stats.map(s => `${s.name}: ${s.p}%`).join('\n')}
        `.trim();

        fs.writeFileSync(OUTPUT_FILE, fullContext);
        updateDashboard(fullContext, tasks, stats, inbox);

        console.log(`✅ SUCCESS: DASHBOARD_SYNC_COMPLETE`);
    } catch (err) {
        console.error("❌ SYNC_ERROR:", err.message);
    }
}

generateBridge();
