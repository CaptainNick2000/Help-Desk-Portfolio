# HD-007 — Device not compliant in Intune

**Type:** Incident  
**Priority:** Medium  
**Area:** Endpoint / Intune

## User request

Company Portal says my laptop is not compliant. I can’t install an app / get work email on this device.

## Checks

- Confirmed it is this one device, not every laptop
- User can get to the internet
- Company Portal signed in with the work Entra account
- Last check-in time
- Which control is failing (BitLocker, firewall, OS version, PIN, etc.)

## Root cause

Device had not checked in, or one compliance control was failing after an update. Not “Intune is down.”

## Resolution

1. Forced a sync from Company Portal
2. Waited and refreshed compliance
3. Fixed the actual failing control if it still failed (e.g. disk encryption / Windows update)
4. Confirmed compliance flipped to OK
5. Installed the app / confirmed mail after that
6. If many devices failed the same control, would have stopped treating it as one laptop and flagged the policy

## Close notes

Sync first. Read the failing control. Don’t assign extra licences to fix compliance.

No mailbox and not compliant are different tickets. HD-002 is mail. This is the device.
