const fs = require('fs');
const path = require('path');

function findFile(startPath, filename) {
    if (!fs.existsSync(startPath)) {
        return null;
    }

    const files = fs.readdirSync(startPath);
    for (let i = 0; i < files.length; i++) {
        const file = path.join(startPath, files[i]);
        try {
            const stat = fs.lstatSync(file);
            if (stat.isDirectory()) {
                const result = findFile(file, filename);
                if (result) return result;
            } else if (files[i] === filename) {
                return file;
            }
        } catch (e) {
            // Ignore permission errors
        }
    }
    return null;
}

const basePath = 'C:\\Users\\PC\\Documents';

const filesToUpdate = [
    'ESO MIND (Handover).md',
    'ESO BODY (Build log).md',
    'ESO MIND (File manifest).md'
];

filesToUpdate.forEach(filename => {
    console.log(`Searching for ${filename}...`);
    const filepath = findFile(basePath, filename);
    if (filepath) {
        console.log(`Found: ${filepath}`);
        let content = fs.readFileSync(filepath, 'utf8');
        
        if (filename.includes('Handover')) {
            content += '\n- Done: Brain Dump inbox system built\n';
        } else if (filename.includes('Build log')) {
            content += '\n| 2026-04-21 | Antigravity | Built full inbox system — inbox file, categoriser, change log, n8n workflow, guide | Import workflows to n8n |\n';
        } else if (filename.includes('File manifest')) {
            content += '\n| # | Path | Description | When to read | Status |\n|---|---|---|---|---|\n| - | C:\\Users\\PC\\Documents\\Eso Brain\\04_Agents\\Brain Dump\\Universal Inbox.md | Universal root inbox | Daily | Active |\n';
        }
        
        fs.writeFileSync(filepath, content);
        console.log(`Updated ${filepath}`);
    } else {
        console.log(`Could not find ${filename}`);
        // Create mock files in the current dir for safety
        fs.writeFileSync(filename, `Mock created for ${filename}\n`);
    }
});
