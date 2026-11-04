# HD-005 — New starter onboarding

**Type:** Service request  
**Priority:** Medium  
**Area:** Identity + endpoint + mail

## User request

Manager wants a new starter set up for Monday. Needs login, email, laptop access, and the team apps/drive.

## Checks

- Got the start date, name, manager, and department
- Checked what access they actually need
- Confirmed there is a free licence for Exchange/M365 and Intune
- Checked if the laptop can enrol in Intune

## Root cause

Not a break. Account and device just haven’t been built yet.

## Resolution

1. Created the user in Entra / 365 Admin with the right UPN
2. Assigned Microsoft 365 Business Basic so the mailbox exists
3. Assigned Intune so the device can enrol
4. Added them to the right groups instead of giving access one by one, this is because groups make it easy to remove later and the next person in the same team gets the same access
5. Confirmed outlook.office.com opens after the mailbox provisions
6. Enrolled the laptop in Company Portal
7. Smoke tested sign-in, mail, and one required app

## Close notes

Onboarding is a checklist, not just create user and walk away. No Exchange licence means no mailbox. Access via groups. Test once before calling it done.
