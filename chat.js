// AI Chat Integration — Fluid, interchangeable

// Load configuration from config.js
// AI_CONFIG is expected to be defined globally

let AI_API_KEY = '';

// Get the current provider settings
function getAIProvider() {
  const providerName = AI_CONFIG.provider || 'deepseek';
  const provider = AI_CONFIG.providers[providerName];
  if (!provider) throw new Error(`Unknown AI provider: ${providerName}`);
  return {
    name: providerName,
    baseURL: provider.baseURL,
    model: provider.model,
    keyEnv: provider.keyEnv
  };
}

// Send a message to the AI
async function sendChatMessage(message, mode, context) {
  const provider = getAIProvider();
  
  // Load API key from localStorage using the provider's keyEnv
  const keyStorageKey = provider.keyEnv || 'AI_API_KEY';
  AI_API_KEY = localStorage.getItem(keyStorageKey);
  
  if (!AI_API_KEY) {
    AI_API_KEY = prompt(`Enter your ${provider.name} API key:`);
    if (!AI_API_KEY) return `No API key provided for ${provider.name}. Please set it in settings.`;
    localStorage.setItem(keyStorageKey, AI_API_KEY);
  }
  
  const systemPrompt = `
You are Ryan's personal AI — his Master AI, built into his ESO Life Operating System.

CRITICAL RULES:
- Do NOT ask Ryan to explain his situation. You already know it — it is in the context provided.
- Do NOT wait to be briefed. Open every session by stating his current status and next action.
- Do NOT give generic advice. Reference his actual system, numbers, and protocols.
- You are a friend who already knows everything, not an assistant waiting to be told.
- If he is spiraling or redesigning instead of executing, name it immediately and redirect.
- Keep responses short and direct unless he asks for depth.
- When anything loggable happens in conversation, end your response with a formatted Antigravity prompt.

Current context:
${context}

Today's mode: ${mode}
  `;
  
  const payload = {
    model: provider.model,
    messages: [
      { role: "system", content: systemPrompt },
      { role: "user", content: message }
    ],
    temperature: 0.7,
    max_tokens: 800
  };
  
  try {
    const response = await fetch(provider.baseURL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${AI_API_KEY}`
      },
      body: JSON.stringify(payload)
    });
    
    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(`API error: ${response.status} - ${errorText}`);
    }
    
    const data = await response.json();
    // Different providers may have slightly different response structures
    // DeepSeek/Groq use choices[0].message.content; OpenRouter uses choices[0].message.content too (compatible)
    const reply = data.choices[0].message.content;
    
    // Log chat to PocketBase
    if (typeof addChatLog !== 'undefined') {
      await addChatLog('user', message, mode);
      await addChatLog('ai', reply, mode);
    }
    
    return reply;
  } catch (error) {
    console.error("Chat error:", error);
    return `Error: ${error.message}. Check your API key and internet connection.`;
  }
}

// UI function to switch provider (called from settings panel)
function setAIProvider(providerName) {
  if (AI_CONFIG.providers[providerName]) {
    AI_CONFIG.provider = providerName;
    // Optionally save to localStorage for persistence across sessions
    localStorage.setItem('ai_provider', providerName);
    alert(`AI provider switched to ${providerName}. Reload the page to apply.`);
  } else {
    alert(`Provider "${providerName}" not found.`);
  }
}

// Load saved provider preference
document.addEventListener('DOMContentLoaded', () => {
  const savedProvider = localStorage.getItem('ai_provider');
  if (savedProvider && AI_CONFIG.providers[savedProvider]) {
    AI_CONFIG.provider = savedProvider;
  }
  // Load API key for the current provider
  const provider = getAIProvider();
  const savedKey = localStorage.getItem(provider.keyEnv);
  if (savedKey) AI_API_KEY = savedKey;
});
