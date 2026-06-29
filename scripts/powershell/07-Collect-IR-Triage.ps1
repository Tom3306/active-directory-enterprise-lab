[CmdletBinding()]
param(
    [string]$OutputDirectory = ".\evidence"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path $OutputDirectory)) {
    New-Item -ItemType Directory -Path $OutputDirectory | Out-Null
}

Get-Date | Out-File "$OutputDirectory\collection-time.txt"
whoami /all | Out-File "$OutputDirectory\whoami-all.txt"
ipconfig /all | Out-File "$OutputDirectory\ipconfig-all.txt"
netstat -ano | Out-File "$OutputDirectory\netstat-ano.txt"
Get-LocalUser | Select-Object Name, Enabled, LastLogon | Export-Csv -NoTypeInformation "$OutputDirectory\local-users.csv"
Get-LocalGroup | Select-Object Name, Description | Export-Csv -NoTypeInformation "$OutputDirectory\local-groups.csv"
Get-Process | Select-Object Name, Id, Path, StartTime -ErrorAction SilentlyContinue | Export-Csv -NoTypeInformation "$OutputDirectory\processes.csv"

wevtutil epl Security "$OutputDirectory\Security.evtx"
wevtutil epl System "$OutputDirectory\System.evtx"
wevtutil epl "Microsoft-Windows-Sysmon/Operational" "$OutputDirectory\Sysmon.evtx"

