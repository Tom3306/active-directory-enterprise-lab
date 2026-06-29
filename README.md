# Active Directory Enterprise Lab

A portfolio-grade Windows enterprise security lab for Active Directory administration, hardening, detection engineering, attack simulation, and incident response.

## Business Problem

Many ransomware intrusions begin with identity weaknesses: weak passwords, overprivileged users, misconfigured Group Policy, poor logging, and unmanaged lateral movement. This lab shows how to build a small Windows domain, attack it safely, detect suspicious behavior, and improve defenses.

## What This Builds

- Domain Controller design for `corp.local`
- Workstation and file server topology
- Organizational Units and security groups
- Lab users and service account model
- Group Policy security baseline
- Sysmon endpoint telemetry configuration
- Wazuh rules for Active Directory detections
- Sigma detections for common identity attacks
- Safe attack simulations to generate telemetry
- Incident response collection script and runbook

## Repository Structure

| Path | Purpose |
| --- | --- |
| `config/` | Lab inventory and network design |
| `scripts/powershell/` | AD build, hardening, telemetry, and IR scripts |
| `security/sysmon/` | Sysmon configuration |
| `security/wazuh/` | Wazuh detection rules |
| `detections/sigma/` | Portable detection analytics |
| `attack-simulations/` | Safe lab-only telemetry simulations |
| `docs/` | Architecture, build guide, controls, detection engineering, IR, recruiter brief |

## Quick Start

1. Read [Architecture](docs/architecture.md).
2. Follow [Build Guide](docs/build-guide.md).
3. Apply [Hardening Controls](docs/hardening-controls.md).
4. Review [Detection Engineering](docs/detection-engineering.md).
5. Run lab-only simulations in [Attack Simulations](attack-simulations/README.md).
6. Practice response with [Incident Response Runbook](docs/incident-response-runbook.md).

## Safety

This project is for an isolated lab domain only. Do not run attack simulations against real organizations, production networks, or systems you do not own.

## Recruiter Summary

This project demonstrates practical Windows security engineering: Active Directory administration, identity security, Group Policy hardening, Sysmon/Wazuh detection engineering, and incident response for realistic ransomware-style attack paths.

