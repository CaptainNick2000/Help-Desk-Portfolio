# Help Desk Ticket Portfolio

Sample first-line tickets written in help-desk style — intake, checks, root cause, fix, and close notes.

Built to show how I work a ticket, not just list tools.

**Nicholas Della Penna-Brown**  
Melbourne, Australia  
Contact: LinkedIn or the email on my resume

Australian Citizen · Full working rights  
ITIL Foundation V4

---

## Why this repo exists

Hiring managers rarely see *how* a candidate troubleshoots. This folder is a small set of realistic tickets covering the work I have done and still practise:

- Active Directory account and access issues
- Microsoft 365 / Outlook
- VPN and name resolution
- Printers and hardware
- New-starter onboarding
- Wi-Fi / endpoint network problems
- Intune compliance
- Approved software requests

Each ticket follows the same path I use in a queue:

1. Confirm the user and the impact
2. Check the obvious layers first
3. Separate *one device* from *the whole service*
4. Fix it
5. Leave a note the next person can use

---

## Tickets

| ID | Title | Area |
|---|---|---|
| [HD-001](HD-001-account-lockout.md) | Account lockout / AD password reset | Identity / Active Directory |
| [HD-002](HD-002-outlook-cannot-send.md) | Outlook cannot send email | Microsoft 365 |
| [HD-003](HD-003-vpn-connection-failure.md) | VPN connects then drops | Network / remote access |
| [HD-004](HD-004-printer-offline.md) | Floor printer offline / stuck queue | Hardware / peripherals |
| [HD-005](HD-005-new-starter-onboarding.md) | New starter onboarding | Service request / identity + endpoint |
| [HD-006](HD-006-wifi-intermittent.md) | Wi-Fi drops on one laptop | Network / endpoint |
| [HD-007](HD-007-intune-noncompliant.md) | Device not compliant in Intune | Endpoint / Intune |
| [HD-008](HD-008-software-request-install.md) | Approved software install | Service request / software |

---

## What I actually use

**Support & identity**  
Active Directory (users, groups, lockouts), ticket lifecycle, incident vs service request, Jira / Confluence-style notes

**Microsoft endpoint & cloud**  
Windows 10/11, Office 365, Entra ID concepts, Intune enrolment / compliance / Company Portal

**Networking**  
TCP/IP, DNS, DHCP, VPN client issues, Wi-Fi, `ping`, `tracert`, `nslookup`, `ipconfig`

**Hardware & other**  
Laptops, desktops, printers, asset basics, PowerShell and Python for small repeatable checks

I keep a local Windows Server + Windows 10/11 lab for AD, GPO, account/access issues, and ticket-style write-ups so the practice matches a help-desk queue — not just installs.

---

## How to read a ticket

Every file is written the way I would leave it for a teammate:

- **User request** — what they said, not what I assumed
- **Checks** — what I verified before changing anything
- **Root cause** — one clear sentence
- **Resolution** — numbered steps
- **Close notes** — the pattern to reuse next time

These are portfolio samples based on real first-line work and lab practice. They are not live customer data.

---

## Background

- IT Help Desk Operator — Würth Australia (2022)
- Independent IT upskilling and home lab (current)
- Cert IV + Advanced Diploma in Cyber Security
- Bachelor of Electrical Engineering (Honours), RMIT — on leave and available full time

Target role: **IT Help Desk / Service Desk / Desktop Support**.
