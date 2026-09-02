# HD-001 — Account lockout / AD password reset

**Type:** Incident  
**Priority:** High  
**Area:** Identity / Active Directory

## User request

Cannot log into PC or Outlook. Account is locked.

## Checks

- Confirmed identity
- AD: account enabled, lockout status, last bad password time
- Recent failed logons
- Not an offboarding / inactive user
<img width="1225" height="963" alt="image" src="https://github.com/user-attachments/assets/6d980598-fca6-48a4-9d03-145dc8273ab4" />
<img width="1221" height="966" alt="image" src="https://github.com/user-attachments/assets/dacc4dd4-4ca4-46f9-956c-93d571728486" />



## Root cause

Cached old password on Outlook mobile after a password change.

## Resolution

1. Unlocked the AD account
2. Reset password and forced change at next logon
3. Signed out and back in on Outlook mobile
4. Confirmed Windows, Outlook, and Teams

## Close notes

After a reset, update the phone first. Lockouts after a password change are often cached mobile credentials, not a domain outage.
