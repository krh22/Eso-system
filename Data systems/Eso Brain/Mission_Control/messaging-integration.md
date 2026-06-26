# Messaging Integration
**Status:** active | **Last Updated:** 2026-04-12

## WhatsApp via Twilio
1. Activate Twilio WhatsApp Sandbox in Twilio Console.
2. Create n8n Webhook node (POST) and use ngrok for public URL.
3. Set Twilio webhook to n8n URL.
4. Add Function node to extract `Body` and `From`.
5. Add Twilio node to send reply with credentials (Account SID, Auth Token).

## Telegram Bot
1. Create bot via @BotFather, save token.
2. In n8n, use Telegram Trigger node (Get Updates) with token credential.
3. Extract `message.text` and `chat.id` via Function node.
4. Send reply with Telegram node.

## Privacy
- WhatsApp/Twilio: message content goes to Twilio servers.
- Telegram: messages encrypted in transit but stored on Telegram servers.
- Use for non-sensitive notifications only.

## Test Workflow (WhatsApp Echo)
- Webhook → Function (echo) → Twilio (send) → Respond to Webhook.
