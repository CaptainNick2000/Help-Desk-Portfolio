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



## Root cause

Cached old password on Outlook mobile after a password change.

## Resolution

1. Unlocked the AD account
2. Reset password and forced change at next logon
3. Signed out and back in on Outlook mobile
4. Confirmed Windows, Outlook, and Teams

## Close notes

After a reset, update the phone first. Lockouts after a password change are often cached mobile credentials, not a domain outage.
