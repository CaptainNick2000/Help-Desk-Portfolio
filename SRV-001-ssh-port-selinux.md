# SRV-001 — SSH failed after I changed the port

**Type:** Incident  
**Priority:** High  
**Area:** SSH / SELinux

## Problem

I changed the SSH port over to 9347 and then I restarted the sshd service. After I did that I could not connect to the server anymore and the service was failing to start up.

## Checks

- I ran `systemctl status sshd` to see what was going on with the service
- I checked `journalctl -u sshd` to look through the logs
- I ran `semanage port -l | grep ssh` to see if SELinux knew about the port
- I looked at the Lightsail firewall rules to check if the port was allowed

## Cause

The actual sshd config was fine and there was nothing wrong with the settings in it. The problem was that SELinux was blocking the new port and the Lightsail firewall did not have the port open either so the connection could not get through.

## Fix

```bash
sudo semanage port -a -t ssh_port_t -p tcp 9347
sudo firewall-cmd --permanent --add-port=9347/tcp
sudo firewall-cmd --reload
```

I also added the port in the Lightsail Networking tab. I made sure I tested a new SSH session before I closed the old one so I would not get locked out.

## Note

On CentOS if you change the SSH port you need both the firewall rule and the SELinux label. I missed the SELinux part the first time which is why it failed.
