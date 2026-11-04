# HD-006 — Wi-Fi drops on one laptop

**Type:** Incident  
**Priority:** Medium  
**Area:** Network / endpoint

## User request

Wi-Fi keeps dropping on their laptop. Phone is fine on the same network.

## Checks

- Confirmed other devices on the same Wi-Fi are stable, this is because if the phone works then it is not the whole AP
- Ran `ipconfig /all` to see if it has an IP, gateway, and DNS
- Pinged the gateway and 8.8.8.8
- Forgot the Wi-Fi network and rejoined
- Checked the Wi-Fi adapter power settings so it doesn’t sleep

## Root cause

Endpoint issue on that laptop (adapter power saving or stale Wi-Fi profile). Not a building-wide outage.

## Resolution

1. Forgot the SSID and rejoined
2. Set the wireless adapter not to sleep in power management
3. Confirmed ping and a browser session stayed up
4. Would have looked at the AP if the whole room was dropping

## Close notes

Phone works + one PC dies = device first. Everyone dies = network first. Same rule as VPN and printers — scope before changing anything.
