# HD-002 — Outlook cannot send / desktop Outlook blocked

**Type:** Incident  
**Priority:** Medium  
**Area:** Microsoft 365 / Email

## User request

Can’t get Outlook working on the PC. Need to send email.

## Checks

- Confirmed the user and UPN
- Checked licences in Microsoft 365 admin
- User has Microsoft 365 Business Basic (Exchange mailbox) plus Intune
- Waited for the mailbox to provision
- Tested Outlook on the web
- Tried the new Outlook app on Windows

## Root cause

Mailbox was fine. OWA worked.

The new Outlook app on Windows failed because Business Basic does not include that desktop client. Entra + Intune licences also do not create a mailbox on their own.

## Resolution

1. Assigned Microsoft 365 Business Basic so the mailbox exists
2. Waited until outlook.office.com opened an inbox
3. Sent a test email in the browser
4. Explained the desktop app needs a Microsoft 365 Apps licence (Business Standard or similar)
5. User can send from OWA / Outlook mobile in the meantime

## Close notes

No mailbox = Entra/Intune only. Assign Exchange / Business Basic first.

OWA works + new Outlook says “account not supported” = licence/SKU, not a broken profile. Don’t rebuild the profile until the browser has been tested.
