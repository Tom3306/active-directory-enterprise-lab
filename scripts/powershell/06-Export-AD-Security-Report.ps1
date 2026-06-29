[CmdletBinding()]
param(
    [string]$OutputPath = ".\reports\ad-security-report.csv"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$directory = Split-Path -Path $OutputPath -Parent
if ($directory -and -not (Test-Path $directory)) {
    New-Item -ItemType Directory -Path $directory | Out-Null
}

Get-ADUser -Filter * -Properties Enabled, PasswordNeverExpires, LastLogonDate, MemberOf |
    Select-Object SamAccountName, Enabled, PasswordNeverExpires, LastLogonDate, DistinguishedName |
    Export-Csv -NoTypeInformation -Path $OutputPath

Write-Host "Wrote $OutputPath"

