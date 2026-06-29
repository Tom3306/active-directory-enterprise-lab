[CmdletBinding()]
param(
    [string]$DomainDistinguishedName = "DC=corp,DC=local"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$ous = @(
    "Workstations",
    "Servers",
    "Tier0",
    "Service Accounts",
    "Security Groups",
    "Disabled Users"
)

foreach ($ou in $ous) {
    $path = "OU=$ou,$DomainDistinguishedName"
    if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=$ou)" -SearchBase $DomainDistinguishedName -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $ou -Path $DomainDistinguishedName -ProtectedFromAccidentalDeletion $true
    }
}

$groups = @(
    "Helpdesk-Password-Reset",
    "Workstation-Admins",
    "Server-Admins",
    "SOC-Analysts",
    "File-Share-Finance-Read"
)

foreach ($group in $groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $group -GroupScope Global -GroupCategory Security -Path "OU=Security Groups,$DomainDistinguishedName"
    }
}

