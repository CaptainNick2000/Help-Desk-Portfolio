# SRV-002 — WireGuard service failed to start

**Type:** Incident  
**Priority:** High  
**Area:** WireGuard / systemd

## Problem

WireGuard would not start. When I ran `systemctl start wg-quick@wg0` it failed straight away and the service would not stay up.

## Checks

- I ran `systemctl status wg-quick@wg0` to check the service status
- I looked at `journalctl -u wg-quick@wg0` to see the error messages
- I went through `/etc/wireguard/wg0.conf` to check the config
- I checked the permissions on the config file and the key files

## Cause

There were two different problems that came up while I was setting it up:
1. `SaveConfig = true` was causing a permission error when it tried to write out a temp config file.
2. One of the peer public keys was the wrong length so the config would not even load properly.

## Fix

- I changed `SaveConfig` to `false` so it would stop trying to write the temp file
- I put in a proper valid peer public key that was the correct length
- I restarted the service and then checked it with `wg show` to make sure it came up

## Note

The service status just says that it failed. The real error message is in the journal. That is what showed me the permission problem and the bad key.
