# SRV-003 — VPN active but no handshake

**Type:** Incident  
**Priority:** High  
**Area:** WireGuard / Keys

## Problem

The client was saying the tunnel was active but there was no handshake showing up. On the server when I ran `wg show` it listed the peer but there was no endpoint. Nothing was working through the VPN.

## Checks

- I looked at the client log and it said the handshake did not complete
- I ran `sudo wg show` on the server to see the current status
- I compared the public keys between the client and the server to see if they were the same
- I checked the endpoint IP and made sure UDP 51820 was open in the firewall

## Cause

The public key that was on the server did not match the client’s real public key. Because of that the handshake could not finish and the tunnel would not actually work.

## Fix

I updated the peer public key in `wg0.conf` so it matched the one the client was actually using, then I restarted WireGuard.

## Note

If there is no handshake I check the keys first now. I spent a fair bit of time looking at the firewall before I noticed the keys did not match.
