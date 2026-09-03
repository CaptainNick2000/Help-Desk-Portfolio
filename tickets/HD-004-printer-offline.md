# HD-004 — Printer offline / stuck queue

**Type:** Incident  
**Priority:** Medium  
**Area:** Hardware / peripherals

## User request

The printer is offline. Jobs are stuck. I need to print.

## Checks

- Asked: one PC or the whole floor?
- Looked at the printer: power, paper, toner, jam lights, cable/Wi-Fi
- On the user’s PC: printers list, paused / offline, print queue
- Printed a test page from that PC
- If the whole floor was down: pinged the printer IP and checked another PC

## Root cause

One bad job had paused the queue (or a jam that looked cleared but left the printer/queue stuck). Not a domain outage.

## Resolution

1. Cleared the jam / error on the device if there was one
2. Cancelled the stuck job
3. Restarted the Print Spooler on the PC if the queue would not move
   - Services → Print Spooler → Restart
4. Printed a test page
5. If only one user was affected, stopped there
6. If everyone was down and the printer did not ping, escalated / checked network

## Close notes

One user → local queue / spooler / their driver first.
Whole floor → device + network + print server.

Don’t rebuild Outlook or reset AD for a printer ticket.
