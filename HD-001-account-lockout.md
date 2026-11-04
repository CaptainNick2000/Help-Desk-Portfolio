# HD-001 — Account lockout / AD password reset

**Type:** Incident  
**Priority:** High  
**Area:** Identity / Active Directory

## User request

User can’t log into their PC. It says the account is locked.

## Checks

- Confirmed who they are so I’m not resetting the wrong person
- Opened Active Directory and checked if the account is enabled and locked
- Asked if they just changed their password recently
- Asked if their phone or Outlook is still signed in with the old password, this is because the phone can keep trying the old password and lock the account again

## Root cause

Old password still saved on the phone. It kept failing and locked the account.

## Resolution

1. Unlocked the account in AD
2. Reset the password if they needed a new one and set it so they have to change it next logon
3. Told them to sign out of email on the phone and sign back in with the new password
4. Watched them log into Windows to confirm it worked

## Close notes

After a password change, check the phone first. Lockouts after a reset are usually the phone still using the old password, not the domain being broken.
