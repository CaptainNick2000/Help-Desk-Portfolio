# SRV-005 — Package install got killed

**Type:** Incident  
**Priority:** Medium  
**Area:** Resources

## Problem

When I tried to run `dnf install` it just got killed part way through. The server was also feeling laggy around the same time.

## Checks

- I ran `free -h` to see how much memory was available
- I checked the Lightsail instance size and it was only 1 GB at the time
- I looked in the logs for any out-of-memory messages

## Cause

The instance ran out of memory while it was doing the install. The OOM killer ended up stopping the process because there was not enough RAM left.

## Fix

- I added a swap file so it had a bit of extra room to work with
- I upgraded the Lightsail instance to 2 GB

## Note

1 GB is pretty tight once you start installing packages. WireGuard itself does not use much RAM. It was the installs that were causing the problem.
