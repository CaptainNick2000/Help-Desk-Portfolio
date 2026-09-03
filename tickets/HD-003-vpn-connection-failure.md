# HD-003 — VPN connects then drops / no internal access

**Type:** Incident  
**Priority:** High  
**Area:** Network / remote access

## User request

VPN connects, then I still can’t get to shared drives / internal sites. Sometimes it drops.

## Checks

- Confirmed they have internet without the VPN (browser, ping 8.8.8.8)
- Confirmed it is one user, not everyone
- Checked the VPN client is installed and they are using the work profile
- Connected, then on the PC ran:
  - `ipconfig /all`
  - `ping` to the gateway / a known internal host
  - `nslookup` on an internal name
- Asked if they are on home Wi-Fi, hotspot, or another VPN at the same time

## Root cause

Internet was fine. After connect, internal names were not resolving (DNS) / the client was stale. Not “the whole VPN is down.”

## Resolution

1. Updated or repaired the VPN client if it was old
2. Reconnected
3. Confirmed DNS after connect
4. `ipconfig /flushdns`
5. Tested an internal name and a file share
6. If it still failed for everyone, escalated to network — didn’t keep guessing on one PC

## Close notes

Public internet up ≠ internal access.

One person broken → client, DNS after connect, or their Wi-Fi.
Whole company broken → escalate. Don’t rebuild Outlook or Intune for this.
