# HD-005 — New starter onboarding

**Type:** Service request  
**Priority:** Medium  
**Area:** Identity + endpoint + mail

## User request

Manager: new starter Monday. Needs a login, email, laptop access, and the team drive / apps.

## Checks

- Start date, name, manager, department
- What access they actually need
- Whether a licence is free (Exchange / M365, Intune)
- Whether the laptop is in inventory / can enrol in Intune

## Root cause

Not an incident. Account and device were not built yet.

## Resolution

1. Created the user in Entra / 365 Admin with the right UPN
2. Assigned Microsoft 365 Business Basic so the mailbox exists
3. Assigned Intune so the device can enrol
4. Added them to the right groups (don’t grant access user-by-user)
5. Confirmed outlook.office.com opens after the mailbox provisions
6. Enrolment / Company Portal on the laptop
7. Smoke test: sign-in, mail, Teams if licensed, required app
8. Sent the manager the first-day basics (username, that mail is in the browser until desktop apps are licensed)

## Close notes

Onboarding is a checklist, not “create user” and walk away.

No Exchange licence = no mailbox. Entra + Intune alone is not Outlook.

Access via groups. Test once before you call it done.
