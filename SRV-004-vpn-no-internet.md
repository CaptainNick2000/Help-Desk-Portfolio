# SRV-004 — VPN connected but no internet

**Type:** Incident  
**Priority:** High  
**Area:** WireGuard / NAT

## Problem

The handshake was working fine, but as soon as I turned the VPN on I lost all internet access on my machine.

## Checks

- The client was set to `AllowedIPs = 0.0.0.0/0` which is a full tunnel
- I ran `sysctl net.ipv4.ip_forward` and it was already set to 1
- I ran `firewall-cmd --list-all` to see if masquerade and forward were turned on
- I ran `sudo wg show` to confirm the handshake was actually there

## Cause

The server was not doing NAT. So the traffic was going into the tunnel but it could not get out to the internet.

## Fix

```bash
sudo firewall-cmd --permanent --add-masquerade
sudo firewall-cmd --permanent --add-forward
sudo firewall-cmd --reload
```

## Note

If you are using a full tunnel you need masquerade turned on. Without it the VPN will connect and then you just lose internet.
