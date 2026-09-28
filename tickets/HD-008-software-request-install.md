# HD-008 — Approved software install

**Type:** Service request  
**Priority:** Low  
**Area:** Endpoint / software

## User request

Please install [approved app] on my work laptop. I need it this week.

## Checks

- Is the app on the approved list?
- One user or a team request?
- Device enrolled and **compliant** in Intune? (if not → HD-007 first)
- Is the app already in Company Portal?
- Disk space / already installed?

## Root cause

Not an outage. They need software through the proper channel.

## Resolution

1. Confirmed the app is approved
2. If it is in Company Portal: user installs from there (no random .exe)
3. If the device was non-compliant: fixed compliance, synced, then installed
4. If the app is not in the catalogue: logged a request for packaging / Intune deploy — did not sideload
5. User opened the app and signed in
6. Closed as fulfilled

## Close notes

Help desk value is the process: approved source + audit trail.

Compliant device + app in Portal = install.
Not in Portal = request to packager, not “download from the website.”
