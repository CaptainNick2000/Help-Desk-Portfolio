# SRV-006 — Could not reach the service from outside

**Type:** Incident  
**Priority:** High  
**Area:** Firewall / Networking

## Problem

The service was running on the server but I could not connect to it from my own machine.

## Checks

- I ran `ss -tulpn` to see if it was actually listening on the port
- I ran `firewall-cmd --list-all` to check the local firewall rules
- I looked at the Lightsail Networking tab to see the cloud firewall
- I ran `semanage port -l` to check if SELinux was blocking it

## Cause

The port was open in one place but not in the others. On Lightsail you have the cloud firewall and then firewalld on the server. SELinux can also block the port as well if the label is missing.

## Fix

I opened the port in firewalld and also in the Lightsail console. I added the SELinux label if it was needed and then I reloaded the firewall.

## Note

It is easy to forget one of the layers. Now I check all three when something will not connect from outside.
