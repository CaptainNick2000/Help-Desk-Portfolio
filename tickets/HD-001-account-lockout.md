# HD-001 — Account lockout / AD password reset

**Type:** Incident  
**Priority:** High  
**Area:** Identity / Active Directory

## User request

Cannot log into the PC. Message says the account is locked.

## Checks

- Confirmed who they are
- Opened AD and checked enabled / locked
- Asked if they just changed their password
- Asked if phone or Outlook is still signed in

## Root cause

Old password still saved on the phone. It kept failing and locked the account.

## Resolution

1. Unlocked the account in AD
2. Reset the password if they needed a new one
3. Told them to sign out of email on the phone and sign back in
4. Watched them log into Windows

## Close notes

If they just changed their password, check the phone before you assume AD is broken.
