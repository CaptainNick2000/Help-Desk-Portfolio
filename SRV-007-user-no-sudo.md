# SRV-007 — User could not run admin commands

**Type:** Access  
**Priority:** Medium  
**Area:** Users / sudo

## Problem

The system-administrator user could not edit any system files or use sudo to run commands.

## Checks

- I ran `sudo -l -U system-administrator` to see what rights it had
- I checked which groups the user was in

## Cause

I had removed the user from the wheel group earlier on so it did not have any sudo rights. That was on purpose, but it meant I could not use that account when I needed to do admin work on the server.

## Fix

I used the Lightsail browser SSH or another account that still had sudo for anything that needed root. I left system-administrator as a normal user.

## Note

Once you take sudo away from an account you need another way to do admin tasks, otherwise you can end up locking yourself out of managing the server.
