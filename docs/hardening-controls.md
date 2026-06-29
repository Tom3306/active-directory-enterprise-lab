# Hardening Controls

| Area | Control | Evidence |
| --- | --- | --- |
| Identity | Separate OUs for workstations, servers, service accounts, and Tier 0 assets | `02-Configure-OUs-And-Groups.ps1` |
| Least privilege | Security groups for delegated roles instead of direct admin assignment | `config/lab-inventory.yml` |
| Authentication | Disable weak LAN Manager compatibility | `04-Apply-Security-Baseline.ps1` |
| Credential protection | Enable LSA protection | `04-Apply-Security-Baseline.ps1` |
| Endpoint visibility | Install Sysmon with focused telemetry rules | `security/sysmon/sysmon-config.xml` |
| Auditability | Export AD account posture report | `06-Export-AD-Security-Report.ps1` |
| Incident response | Collect event logs, processes, network state, and local principals | `07-Collect-IR-Triage.ps1` |

## Recommended Manual Additions

- Enforce MFA for remote access paths.
- Disable or tightly restrict NTLM where compatibility allows.
- Enable Windows Defender credential protections.
- Use separate admin accounts for privileged operations.
- Review stale accounts and password-never-expires exceptions weekly.

