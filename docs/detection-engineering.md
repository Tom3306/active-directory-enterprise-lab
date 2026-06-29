# Detection Engineering

## Telemetry Sources

- Windows Security event log
- Sysmon operational log
- PowerShell operational log
- Wazuh agent events

## Detection Coverage

| Behavior | Data Source | Detection |
| --- | --- | --- |
| Privileged group change | Windows Security | `detections/sigma/privileged-group-change.yml` |
| Password spray | Windows Security | `detections/sigma/password-spray.yml` |
| Suspicious PowerShell | Sysmon process creation | `detections/sigma/suspicious-powershell.yml` |
| Kerberoasting signal | Windows Security Kerberos events | `detections/sigma/kerberoasting-indicators.yml` |
| Shadow copy manipulation | Sysmon process creation | `security/wazuh/ad-lab-rules.xml` |

## Tuning Notes

- Privileged group detections should be high severity but suppress approved change windows.
- Password spray detections should aggregate by source host and target user count.
- Kerberoasting detections require local baselining because legacy applications can still use RC4.
- PowerShell detections should combine command-line flags, parent process, and user context.

