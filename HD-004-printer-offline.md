# HD-004 — Printer offline / stuck queue

**Type:** Incident  
**Priority:** Medium  
**Area:** Hardware / peripherals

## User request

Printer is offline. Jobs are stuck. Need to print.

## Checks

- Asked if it is one PC or the whole floor, this is because one PC is usually the local queue, whole floor is the printer itself or the network
- Looked at the printer for power, paper, toner, jam lights
- On the user’s PC checked the printers list and if the queue was paused
- Printed a test page

## Root cause

One bad job had paused the queue. Not a domain or network outage.

## Resolution

1. Cleared any jam or error on the printer
2. Cancelled the stuck job
3. Restarted the Print Spooler service if the queue still wouldn’t move
4. Printed a test page to confirm
5. Stopped there because it was only one user

## Close notes

One user = local queue or spooler first. Whole floor = device and network. Don’t reset AD or rebuild Outlook for a printer.
