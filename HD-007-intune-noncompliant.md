# HD-007 — Device not compliant in Intune

**Type:** Incident  
**Priority:** Medium  
**Area:** Endpoint / Intune

## User request

Company Portal says the laptop is not compliant. Can’t install an app or get work email on this device.

## Checks

- Confirmed it is this one device, not every laptop
- Confirmed they can get to the internet
- Company Portal signed in with the work Entra account
- Checked last check-in time, this is because Intune only knows what the laptop last reported
- Looked at which control is failing (BitLocker, firewall, OS version, etc.)

## Root cause

Device had not checked in, or one compliance control was failing. Not Intune being down.

## Resolution

1. Forced a sync from Company Portal
2. Waited and refreshed compliance
3. Fixed the actual failing control if it still failed
4. Confirmed compliance flipped to OK
5. Installed the app after that
6. Would flag the policy if many devices failed the same control

## Close notes

Sync first. Read the failing control. Don’t assign extra licences to fix compliance. No mailbox and not compliant are different tickets.
