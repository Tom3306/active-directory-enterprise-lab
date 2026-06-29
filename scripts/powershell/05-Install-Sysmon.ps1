[CmdletBinding()]
param(
    [string]$SysmonExe = "C:\Tools\Sysmon64.exe",
    [string]$ConfigPath = "C:\Tools\sysmon-config.xml"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Test-Path $SysmonExe)) {
    throw "Sysmon executable not found at $SysmonExe"
}

if (-not (Test-Path $ConfigPath)) {
    throw "Sysmon config not found at $ConfigPath"
}

& $SysmonExe -accepteula -i $ConfigPath

