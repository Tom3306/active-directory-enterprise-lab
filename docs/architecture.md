# Architecture

## Lab Topology

The lab models a small Windows enterprise environment.

| Host | Role | Purpose |
| --- | --- | --- |
| DC01 | Domain Controller, DNS | Active Directory identity control plane |
| FS01 | File Server | Business data and share permissions |
| WS01 | Workstation | User endpoint and attack simulation target |
| WAZUH01 | Detection Server | Central alerting and telemetry review |

## Network

- CIDR: `10.10.20.0/24`
- Domain: `corp.local`
- DNS: `10.10.20.10`
- Domain Controller: `10.10.20.10`

## Security Goals

- Separate users, servers, workstations, service accounts, and privileged groups into managed OUs.
- Apply baseline hardening through Group Policy.
- Deploy Sysmon for endpoint telemetry.
- Forward Windows and Sysmon events into Wazuh.
- Detect common ransomware and identity attack behaviors.
- Practice incident response triage with repeatable evidence collection.

