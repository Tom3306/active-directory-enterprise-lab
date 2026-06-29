# Active Directory Enterprise Lab

A small Windows domain lab for practicing Active Directory administration, hardening, detection engineering, and incident response in an isolated environment.

## Business Problem

Many ransomware intrusions begin with ordinary identity weaknesses: weak passwords, overprivileged users, loose Group Policy, poor logging, and unmanaged lateral movement. This repo keeps the scope practical: build a small lab domain, generate safe telemetry, and tune detections without touching a real environment.

## What Is Included

- Domain Controller plan for `corp.local`
- Workstation, file server, and Wazuh topology
- Organizational Units and security groups
- Lab users and service account model
- Group Policy security baseline
- Sysmon endpoint telemetry configuration
- Wazuh rules for Active Directory detections
- Sigma detections for common identity attacks
- Lab-only simulations to generate telemetry
- Incident response collection script and runbook

## Validation Status

The repository content has been checked for required files, XML parsing, PowerShell script presence, and whitespace issues. The scripts have not yet been executed against live Windows VMs in this workspace, so treat this as a reproducible lab blueprint until you run it in an isolated domain.

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

This project shows the pieces a focused Windows security lab should have: AD structure, hardening scripts, endpoint telemetry, Wazuh/Sigma detections, controlled simulations, and an investigation runbook. It should not be described as a production AD deployment or as live-tested until the Windows lab has actually been built.
