[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module GroupPolicy

$gpoName = "CORP - Security Baseline"
if (-not (Get-GPO -Name $gpoName -ErrorAction SilentlyContinue)) {
    New-GPO -Name $gpoName | Out-Null
}

Set-GPRegistryValue -Name $gpoName -Key "HKLM\System\CurrentControlSet\Control\Lsa" -ValueName "RunAsPPL" -Type DWord -Value 1
Set-GPRegistryValue -Name $gpoName -Key "HKLM\System\CurrentControlSet\Control\Lsa" -ValueName "LmCompatibilityLevel" -Type DWord -Value 5
Set-GPRegistryValue -Name $gpoName -Key "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName "LocalAccountTokenFilterPolicy" -Type DWord -Value 0
Set-GPRegistryValue -Name $gpoName -Key "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName "EnableLUA" -Type DWord -Value 1
Set-GPRegistryValue -Name $gpoName -Key "HKLM\Software\Microsoft\PowerShell\3\PowerShellEngine" -ValueName "EnableScriptBlockLogging" -Type DWord -Value 1

Write-Host "Created baseline GPO. Link it to the lab OUs after validating impact."

