[CmdletBinding()]
param(
    [string]$DomainName = "corp.local",
    [string]$NetbiosName = "CORP",
    [string]$SafeModeAdministratorPassword
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not $SafeModeAdministratorPassword) {
    throw "Provide SafeModeAdministratorPassword from a local lab secret store."
}

$securePassword = ConvertTo-SecureString $SafeModeAdministratorPassword -AsPlainText -Force

Install-WindowsFeature AD-Domain-Services, DNS -IncludeManagementTools

Install-ADDSForest `
    -DomainName $DomainName `
    -DomainNetbiosName $NetbiosName `
    -SafeModeAdministratorPassword $securePassword `
    -InstallDns `
    -Force

