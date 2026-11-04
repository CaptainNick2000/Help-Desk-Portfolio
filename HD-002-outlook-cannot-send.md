# HD-002 — Outlook cannot send

**Type:** Incident  
**Priority:** Medium  
**Area:** Microsoft 365 / Email

## User request

Outlook on the PC won’t send. Emails sit in Outbox or the app won’t set up.

## Checks

- Confirmed the user and their UPN
- Tested Outlook on the web first, this is because if the browser can send then the mailbox itself is fine and the problem is just the PC app
- Checked licences in Microsoft 365 admin to see if they even have a mailbox
- Tried the new Outlook app on Windows

## Root cause

Mailbox was fine once Business Basic was assigned. OWA worked. The new Outlook app on Windows failed because Business Basic does not include the desktop client. Entra + Intune alone does not create a mailbox.

## Resolution

1. Assigned Microsoft 365 Business Basic so the mailbox exists
2. Waited until outlook.office.com opened an inbox
3. Sent a test email in the browser
4. Explained they can use the web or phone for now, or request a licence that includes the desktop apps if they need the Windows app

## Close notes

If OWA works, don’t rebuild the profile yet. If the new Outlook says the account is not supported, it’s the licence, not a broken mailbox. No Exchange licence means no mailbox.
