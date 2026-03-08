# Share via WhatsApp

Send a GitHub Pages link to Ori or Shayna via WhatsApp.

## Instructions

Parse `$ARGUMENTS` to determine:
- **Recipient**: "Shayna" if the user says "send to Shayna" / "share with Shayna" / "send it to her". Default is **Ori** (e.g., "send it to me", "share it", or no args).
- **File**: The most recently created or discussed HTML file in the conversation. If ambiguous, ask.

### Steps

1. **Ensure the file is committed and pushed**
   - Run `git status` to check if the file has uncommitted changes
   - If so, stage it, commit with a descriptive message, and `git push`
   - If already committed and pushed, skip this step

2. **Build the GitHub Pages URL**
   - Base URL: `https://shimshihub.github.io/fam/`
   - Append the file's relative path from the repo root
   - Example: `parenting/docs/family-overview.html` → `https://shimshihub.github.io/fam/parenting/docs/family-overview.html`

3. **Write a one-sentence description**
   - Brief, plain language — what is this file about
   - Example: "Family parenting overview with the kids' profiles, schedules, and current challenges."

4. **Send via WhatsApp**
   - Find the recipient's chat using `mcp__whatsapp__search_contacts` (search "Ori" or "Shayna")
   - Then use `mcp__whatsapp__get_direct_chat_by_contact` to get the chat
   - Send the message using `mcp__whatsapp__send_message` with this format:

   ```
   <one-sentence description>
   <GitHub Pages URL>
   ```

   Keep it clean — no extra formatting, no emojis, just the sentence and the link.

5. **Confirm** — Tell the user it was sent and to whom.

### Notes
- GitHub Pages can take 1-2 minutes to update after a push. If the file was just pushed, mention this to the user.
- If the WhatsApp send fails, provide the URL directly so the user can share it manually.
