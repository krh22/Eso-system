const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const { getEnv } = require('./environment');

const env = getEnv();
const BASE_DIR = env.base;
const PATHS_FILE = path.join(BASE_DIR, 'Eso Body', 'eso', 'paths.json');

const IGNORE_LIST = ['.git', '.obsidian', '.smart-env', 'node_modules', 'bin', 'obj', '.gemini'];

function walk(dir, fileList = []) {
    if (!fs.existsSync(dir)) return fileList;
    const files = fs.readdirSync(dir);
    files.forEach(file => {
        if (IGNORE_LIST.includes(file)) return;
        const filePath = path.join(dir, file);
        if (fs.statSync(filePath).isDirectory()) {
            walk(filePath, fileList);
        } else {
            fileList.push(filePath);
        }
    });
    return fileList;
}

try {
    if (!fs.existsSync(PATHS_FILE)) {
        console.error(`Paths file not found at ${PATHS_FILE}`);
        process.exit(1);
    }
    const registry = JSON.parse(fs.readFileSync(PATHS_FILE, 'utf8'));
    
    // Normalize existing paths in registry to absolute for comparison
    const registryAbsPaths = registry.map(entry => {
        return entry.path.includes(':') ? entry.path.toLowerCase() : path.resolve(BASE_DIR, 'Eso Body', entry.path).toLowerCase().replace(/\\/g, '/');
    });

    const allFiles = [
        ...walk(path.join(BASE_DIR, 'Eso Brain')),
        ...walk(path.join(BASE_DIR, 'Eso Body')),
        path.join(BASE_DIR, 'handover.md'),
        path.join(BASE_DIR, 'ai-tools.md'),
        path.join(BASE_DIR, 'files-purpose.txt')
    ];

    let updated = false;

    allFiles.forEach(f => {
        const absolutePath = f.replace(/\\/g, '/').toLowerCase();
        
        // Find if any entry in the registry points to this same absolute path
        const isRegistered = registry.some(entry => {
             const entryAbs = entry.path.includes(':') ? 
                entry.path.replace(/\\/g, '/').toLowerCase() : 
                path.resolve(path.join(BASE_DIR, 'Eso Body'), entry.path).replace(/\\/g, '/').toLowerCase();
             return entryAbs === absolutePath;
        });

        if (!isRegistered) {
            console.log(`Adding new file to registry: ${path.basename(f)}`);
            const relativePath = path.relative(path.join(BASE_DIR, 'Eso Body'), f).replace(/\\/g, '/');
            registry.push({
                "id": path.basename(f, path.extname(f)).toLowerCase().replace(/\s+/g, '_'),
                "label": path.basename(f),
                "path": relativePath.includes('..') ? absolutePath : relativePath,
                "type": "unknown",
                "importance": 3,
                "purpose": "[NEEDS DESCRIPTION] New file DETECTED.",
                "update_type": "Manual",
                "device_sync": false,
                "last_verified": new Date().toISOString().split('T')[0]
            });
            updated = true;
        }
    });

    if (updated) {
        fs.writeFileSync(PATHS_FILE, JSON.stringify(registry, null, 2), 'utf8');
        console.log('Registry synced with local environment.');
    }

    const nodePath = fs.existsSync('C:/Program Files/nodejs/node.exe') ? '"C:/Program Files/nodejs/node.exe"' : 'node';
    execSync(`${nodePath} "${path.join(__dirname, 'manifest_gen.js')}"`, { stdio: 'inherit' });

} catch (err) {
    console.error('Error during path sync:', err);
    process.exit(1);
}
