# SRV-008 — Checked what ports were open

**Type:** Check  
**Priority:** Low  
**Area:** Security / Network

## Problem

I wanted to make sure nothing unexpected was listening after I had made all the changes to the server.

## Checks

```bash
sudo ss -tulpn
sudo firewall-cmd --list-all
```

I also looked at the Lightsail firewall rules to see what was allowed in.

## Cause

There was nothing wrong. Only the services I expected were open:
- SSH on the custom port
- WireGuard on UDP 51820
- Local services like chronyd

## Fix

No changes were needed. The unused ports were already closed and SELinux was still set to enforcing.

## Note

Doing a quick `ss` check shows you if something is exposed that should not be. It does not take long so I do it after I make network changes.
