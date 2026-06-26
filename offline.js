// Offline queue for ESO Hub

const QUEUE_KEY = 'eso_queue';

function getQueue() {
  const data = localStorage.getItem(QUEUE_KEY);
  return data ? JSON.parse(data) : [];
}

function addToQueue(collection, data) {
  const queue = getQueue();
  queue.push({
    collection: collection,
    data: data,
    timestamp: new Date().toISOString()
  });
  localStorage.setItem(QUEUE_KEY, JSON.stringify(queue));
  showOfflineBanner(true);
}

async function flushQueue() {
  if (!navigator.onLine) {
    console.log("Offline: cannot flush queue");
    return;
  }
  const queue = getQueue();
  if (queue.length === 0) return;
  
  console.log(`Flushing ${queue.length} queued items...`);
  let successCount = 0;
  let failedItems = [];
  
  for (const item of queue) {
    try {
      // Use pb functions
      const collection = pb.collection(item.collection);
      await collection.create(item.data);
      successCount++;
    } catch (e) {
      console.error("Failed to sync item:", e);
      failedItems.push(item);
    }
  }
  
  // Keep failed items
  localStorage.setItem(QUEUE_KEY, JSON.stringify(failedItems));
  if (failedItems.length === 0) {
    showOfflineBanner(false);
  } else {
    showOfflineBanner(true);
  }
  console.log(`Synced ${successCount} items, ${failedItems.length} remaining.`);
}

function showOfflineBanner(show) {
  const banner = document.getElementById('offline-banner');
  if (banner) {
    banner.style.display = show ? 'block' : 'none';
  }
}

// Listen to online/offline events
window.addEventListener('online', () => {
  console.log("Online - flushing queue...");
  flushQueue();
});

window.addEventListener('offline', () => {
  showOfflineBanner(true);
});

// Initial check
document.addEventListener('DOMContentLoaded', () => {
  if (!navigator.onLine) {
    showOfflineBanner(true);
  } else {
    // Attempt flush on load
    flushQueue();
  }
});
