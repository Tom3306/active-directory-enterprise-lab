# Attack Simulations

Run these only in an isolated lab domain that you own. They are designed to generate defensive telemetry, not to attack real systems.

## Password Spray Telemetry

Goal: generate failed logon events for detection tuning.

Safe approach:

```powershell
1..12 | ForEach-Object {
    runas /netonly /user:CORP\user$_ "cmd /c whoami"
}
```

Expected telemetry:

- Security Event ID 4625
- Wazuh rule `110002`
- Sigma password spray analytic

## Privileged Group Change

Goal: validate alerting for risky group membership changes.

```powershell
Add-ADGroupMember -Identity "Server-Admins" -Members "h.lee"
Remove-ADGroupMember -Identity "Server-Admins" -Members "h.lee" -Confirm:$false
```

Expected telemetry:

- Security Event IDs 4728, 4732, or 4756
- Wazuh rule `110001`
- Sigma privileged group change analytic

## Suspicious PowerShell

Goal: validate process creation and script block logging.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Write-Output lab-test"
```

Expected telemetry:

- Sysmon Event ID 1
- PowerShell operational logs
- Sigma suspicious PowerShell analytic if suspicious flags are used

