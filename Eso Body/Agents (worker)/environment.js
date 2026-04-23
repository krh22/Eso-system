const os = require('os');
const path = require('path');
const fs = require('fs');

const getEnv = () => {
    const user = os.userInfo().username;
    // Map of known machines
    const machines = {
        'KARANJA': {
            name: 'Main PC (Primary)',
            base: 'C:/Users/KARANJA/Documents',
            automation_ready: true
        },
        'PC': {
            name: 'Secondary PC (Build Node)',
            base: 'C:/Users/PC/Documents', 
            automation_ready: false 
        }
    };

    const current = machines[user] || {
        name: `Unknown Machine (${user})`,
        base: path.join(os.homedir(), 'Documents').replace(/\\/g, '/'),
        automation_ready: false
    };

    return {
        ...current,
        username: user,
        timestamp: new Date().toISOString()
    };
};

module.exports = { getEnv };
