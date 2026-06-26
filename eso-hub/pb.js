// PocketBase Connector for ESO Hub

// This file assumes the PocketBase SDK is loaded globally (from CDN in index.html)
// and that PB_URL and COLLECTIONS are defined in config.js

// Initialize PocketBase instance
const pb = new PocketBase(PB_URL);

// --- INBOX ---
async function addInboxItem(entry, tag = "idea") {
  const data = {
    entry: entry,
    tag: tag,
    date: new Date().toISOString(),
    processed: false
  };
  return await pb.collection(COLLECTIONS.inbox).create(data);
}

async function getInboxItems(processed = false) {
  return await pb.collection(COLLECTIONS.inbox).getList(1, 50, {
    filter: `processed = ${processed}`,
    sort: '-created'
  });
}

async function markInboxProcessed(id) {
  return await pb.collection(COLLECTIONS.inbox).update(id, { processed: true });
}

// --- LOG ---
async function addLogEntry(type, amount, category, mood, note = "") {
  const data = {
    type: type,
    amount: amount,
    category: category,
    mood: mood,
    note: note,
    date: new Date().toISOString()
  };
  return await pb.collection(COLLECTIONS.log).create(data);
}

async function getLogEntries(filter = {}) {
  let filterStr = "";
  if (filter.type) filterStr += `type = "${filter.type}"`;
  if (filter.category) filterStr += filterStr ? ` && category = "${filter.category}"` : `category = "${filter.category}"`;
  if (filter.date_from) filterStr += filterStr ? ` && date >= "${filter.date_from}"` : `date >= "${filter.date_from}"`;
  if (filter.date_to) filterStr += filterStr ? ` && date <= "${filter.date_to}"` : `date <= "${filter.date_to}"`;
  return await pb.collection(COLLECTIONS.log).getList(1, 100, {
    filter: filterStr,
    sort: '-date'
  });
}

// --- REMINDERS ---
async function getReminders(filter = {}) {
  let filterStr = "";
  if (filter.done !== undefined) filterStr = `done = ${filter.done}`;
  if (filter.frequency) filterStr += filterStr ? ` && frequency = "${filter.frequency}"` : `frequency = "${filter.frequency}"`;
  return await pb.collection(COLLECTIONS.reminders).getList(1, 50, {
    filter: filterStr,
    sort: 'time'
  });
}

async function addReminder(time, text, frequency = "once", recurring = false) {
  const data = {
    time: time,
    text: text,
    done: false,
    recurring: recurring,
    frequency: frequency
  };
  return await pb.collection(COLLECTIONS.reminders).create(data);
}

async function markReminderDone(id) {
  return await pb.collection(COLLECTIONS.reminders).update(id, { done: true });
}

// --- BUILD TRACKER ---
async function getBuildProgress(project) {
  return await pb.collection(COLLECTIONS.build_tracker).getList(1, 50, {
    filter: `project = "${project}"`,
    sort: 'step_number'
  });
}

async function updateBuildStep(project, step_number, status, notes = "", step_name = "") {
  // First find the record
  const records = await pb.collection(COLLECTIONS.build_tracker).getList(1, 1, {
    filter: `project = "${project}" && step_number = ${step_number}`
  });
  if (records.items.length === 0) {
    // create
    return await pb.collection(COLLECTIONS.build_tracker).create({
      project: project,
      step_number: step_number,
      step_name: step_name || `Step ${step_number}`,
      status: status,
      notes: notes,
      updated: new Date().toISOString()
    });
  } else {
    const id = records.items[0].id;
    return await pb.collection(COLLECTIONS.build_tracker).update(id, {
      status: status,
      notes: notes,
      updated: new Date().toISOString()
    });
  }
}

// --- CHAT LOG ---
async function addChatLog(role, message, mode, context_snapshot = "") {
  const data = {
    role: role,
    message: message,
    session_date: new Date().toISOString(),
    mode: mode,
    context_snapshot: context_snapshot
  };
  return await pb.collection(COLLECTIONS.chat_log).create(data);
}

async function getChatLog(limit = 50) {
  return await pb.collection(COLLECTIONS.chat_log).getList(1, limit, {
    sort: '+created'
  });
}

// --- FINANCE ---
async function addFinanceEntry(category, amount, direction, week, note = "") {
  const data = {
    category: category,
    amount: amount,
    direction: direction,
    week: week,
    note: note,
    date: new Date().toISOString()
  };
  return await pb.collection(COLLECTIONS.finance).create(data);
}

async function getFinanceSummary(week) {
  const entries = await pb.collection(COLLECTIONS.finance).getList(1, 100, {
    filter: `week = "${week}"`,
    sort: '-date'
  });
  return entries.items;
}
