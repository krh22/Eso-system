// ESO Hub Configuration
// Update this file when server URL changes

const PB_URL = "https://pocketbase-production-e928.up.railway.app";

const COLLECTIONS = {
  inbox: "Inbox",
  log: "log",
  reminders: "reminders",
  build_tracker: "build_tracker",
  chat_log: "chat_log",
  finance: "finance"
};

// --- AI Configuration ---
const AI_CONFIG = {
  // Available providers: 'deepseek', 'groq', 'openrouter', 'custom'
  provider: 'deepseek',  // Change this to switch providers

  // Provider-specific settings
  providers: {
    deepseek: {
      baseURL: 'https://api.deepseek.com/chat/completions',
      model: 'deepseek-chat',
      keyEnv: 'DEEPSEEK_API_KEY'  // localStorage key
    },
    groq: {
      baseURL: 'https://api.groq.com/openai/v1/chat/completions',
      model: 'llama-3.3-70b-versatile',
      keyEnv: 'GROQ_API_KEY'
    },
    openrouter: {
      baseURL: 'https://openrouter.ai/api/v1/chat/completions',
      model: 'meta-llama/llama-3.1-8b-instruct:free',
      keyEnv: 'OPENROUTER_API_KEY'
    },
    custom: {
      baseURL: '',  // set this
      model: '',    // set this
      keyEnv: 'CUSTOM_AI_KEY'
    }
  }
};
