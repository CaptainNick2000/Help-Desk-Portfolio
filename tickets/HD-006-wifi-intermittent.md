# HD-006 — Wi-Fi drops on one laptop

**Type:** Incident  
**Priority:** Medium  
**Area:** Network / endpoint

## User request

Wi-Fi keeps dropping on my laptop. My phone is fine on the same network.

## Checks

- Confirmed other devices on the same Wi-Fi are stable
- One laptop only → treat as the PC, not “the AP is down”
- `ipconfig /all` — have we got an IP, gateway, DNS?
- `ping` the gateway, then `ping 8.8.8.8`
- Forget the Wi-Fi network and rejoin
- Checked the Wi-Fi adapter power settings / driver if it still dropped

## Root cause

Endpoint issue on that laptop (adapter power saving / stale Wi-Fi profile / driver). Not a building-wide outage.

## Resolution

1. Forgot the SSID and rejoined
2. Set the wireless adapter not to sleep in power management
3. Updated the Wi-Fi driver if it was old
4. Confirmed ping and a browser session stayed up
5. If the whole room was dropping, would have stopped blaming the laptop and looked at the AP / network

## Close notes

Phone works + one PC dies = device first.
Everyone dies = network first.

Same rule as VPN and printers: scope before you change anything.
