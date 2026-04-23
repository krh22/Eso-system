const fs = require('fs');
const path = require('path');
const { getEnv } = require('./environment');

const env = getEnv();
const PATHS_FILE = path.join(env.base, 'Eso Body', 'eso', 'paths.json');
const OUTPUT_FILE = path.join(env.base, 'files-purpose.md');

try {
    const registry = JSON.parse(fs.readFileSync(PATHS_FILE, 'utf8'));

    let header = `# ESO LIFE OS: MASTER FILE MANIFEST\n\n`;
    header += `> [!NOTE]\n`;
    header += `> This file defines every file in the Eso system. It explains what each file is, what it DOES, and how it is updated.\n\n`;
    
    header += `## DEVICE CONTEXT\n`;
    header += `- **Active Machine**: ${env.name}\n`;
    header += `- **Sync Strategy**: Hardware Drift Protocol (v1.0)\n`;
    header += `- **Status**: ${env.automation_ready ? '🟢 [AUTOMATION ACTIVE]' : '🟡 [MANUAL MODE / SECONDARY PC]'}\n\n`;
    
    header += `> [!WARNING]\n`;
    header += `> You are working across 2 PCs. If in Manual Mode, n8n/Ollama may be offline. Use the Manual guide in **runbook.md**.\n\n`;
    header += `---\n\n`;

    let output = header;

    const levels = [1, 2, 3];
    const levelLabels = {
        1: '### 🔴 [LEVEL 1: CRITICAL CORE]\n*Foundation files. System breaks without these.*',
        2: '### 🟡 [LEVEL 2: ACTIVE DASHBOARD]\n*Daily life, tasks, and domain tracking.*',
        3: '### 🔵 [LEVEL 3: SYSTEM SUPPORT & ARCHIVE]\n*Background scripts, automation logic, and logs.*'
    };

    levels.forEach(level => {
        const files = registry.filter(f => f.importance === level);
        if (files.length > 0) {
            output += levelLabels[level] + '\n\n';
            files.forEach(f => {
                const fileName = path.basename(f.path);
                output += `- **${fileName}**: ${f.purpose} \`[${f.update_type} Update]\`\n`;
            });
            output += '\n';
        }
    });

    output += '---\n';
    output += `**Last Audit**: ${env.timestamp}  \n`;
    output += `**Update Method**: Automatic (Self-Generating Manifest)\n`;

    fs.writeFileSync(OUTPUT_FILE, output, 'utf8');
    console.log(`Manifest updated for ${env.name} at ${OUTPUT_FILE}`);
    
    // Clean up the old .txt file
    const oldFile = path.join(env.base, 'files-purpose.txt');
    if (fs.existsSync(oldFile)) fs.unlinkSync(oldFile);

} catch (err) {
    console.error('Error generating manifest:', err);
    process.exit(1);
}
