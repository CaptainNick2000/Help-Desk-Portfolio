# Help Desk Ticket Portfolio

Sample first-line tickets and lab notes — intake, checks, root cause, fix, and close notes.

Built to show how I work a ticket, not just list tools.

**Nicholas Della Penna-Brown**  
Melbourne, Australia  
Contact: LinkedIn or the email on my resume

Australian Citizen · Full working rights  
ITIL Foundation V4

---

## Why this repo exists

Hiring managers rarely see *how* a candidate troubleshoots. This is a small set of realistic tickets and lab notes covering help-desk work and a CentOS WireGuard server I set up and fixed.

Help desk:
- Active Directory account and access issues
- Microsoft 365 / Outlook
- VPN and name resolution
- Printers and hardware
- New-starter onboarding
- Wi-Fi / endpoint network problems
- Intune compliance
- Approved software requests

Server lab:
- AWS Lightsail, CentOS, SSH, firewalld, SELinux, WireGuard

Each one follows the same path:

1. Confirm the user and the impact
2. Check the obvious layers first
3. Separate *one device* from the whole service
4. Fix it
5. Leave a note the next person can use

---

## Help desk tickets

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

## CentOS Lightsail / WireGuard notes

Notes from setting up and fixing a CentOS server on AWS Lightsail (SSH, firewalld, SELinux, WireGuard). Lab work only.

| ID | Issue |
|---|---|
| [SRV-001](SRV-001-ssh-port-selinux.md) | SSH failed after I changed the port |
| [SRV-002](SRV-002-wireguard-service-wont-start.md) | WireGuard service failed to start |
| [SRV-003](SRV-003-vpn-no-handshake.md) | VPN said it was active but there was no handshake |
| [SRV-004](SRV-004-vpn-no-internet.md) | VPN connected but I had no internet |
| [SRV-005](SRV-005-low-memory-install.md) | Package install got killed |
| [SRV-006](SRV-006-firewall-blocks-access.md) | Could not reach the service from outside |
| [SRV-007](SRV-007-user-no-sudo.md) | User could not run admin commands |
| [SRV-008](SRV-008-listening-ports-check.md) | Checked what ports were open |

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

**Server lab**  
AWS Lightsail, CentOS, SSH, firewalld, SELinux, WireGuard, systemd

I keep a local Windows Server + Windows 10/11 lab for AD, GPO, account/access issues, and ticket-style write-ups so the practice matches a help-desk queue — not just installs.

---

## How to read them

Every file is written the way I would leave it for a teammate:

- **User request / problem** — what they said or what broke
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