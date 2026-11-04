# HD-003 — VPN connects then drops / no internal access

**Type:** Incident  
**Priority:** High  
**Area:** Network / remote access

## User request

VPN connects but they still can’t get to shared drives or internal sites. Sometimes it drops.

## Checks

- Confirmed they have internet without the VPN (browser loads, ping 8.8.8.8 works)
- Confirmed it is only this one user, not everyone
- Checked the VPN client is installed and they are using the work profile
- After connect ran `ipconfig /all` and `nslookup` on an internal name, this is because the green VPN icon only means the tunnel is up, it does not mean the PC is using work DNS
- Asked if they are on home Wi-Fi or another VPN at the same time

## Root cause

Internet was fine. After connect, internal names were not resolving because the PC was still using home DNS.

## Resolution

1. Reconnected the VPN
2. Confirmed DNS after connect showed the work DNS server
3. Ran `ipconfig /flushdns` so it asks again
4. Tested an internal name and a file share
5. If it was everyone, would escalate instead of keep troubleshooting one PC

## Close notes

Public internet up does not mean internal access. One person = client or DNS after connect. Whole company = escalate. Don’t rebuild Outlook for a VPN ticket.
