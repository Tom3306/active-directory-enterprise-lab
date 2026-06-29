[CmdletBinding()]
param(
    [string]$DomainDistinguishedName = "DC=corp,DC=local",
    [string]$InitialPassword = "ChangeMe-LabOnly-2026!"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$securePassword = ConvertTo-SecureString $InitialPassword -AsPlainText -Force
$users = @(
    @{ Sam = "a.morgan"; Name = "Alice Morgan"; Department = "Finance"; Group = "File-Share-Finance-Read" },
    @{ Sam = "b.carter"; Name = "Ben Carter"; Department = "Engineering"; Group = $null },
    @{ Sam = "h.lee"; Name = "Harper Lee"; Department = "IT"; Group = "Helpdesk-Password-Reset" },
    @{ Sam = "svc.backup"; Name = "Backup Service"; Department = "Service Accounts"; Group = $null }
)

foreach ($user in $users) {
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($user.Sam)'" -ErrorAction SilentlyContinue)) {
        $ou = if ($user.Sam -like "svc.*") { "OU=Service Accounts,$DomainDistinguishedName" } else { "OU=Workstations,$DomainDistinguishedName" }
        New-ADUser `
            -SamAccountName $user.Sam `
            -UserPrincipalName "$($user.Sam)@corp.local" `
            -Name $user.Name `
            -Department $user.Department `
            -Path $ou `
            -AccountPassword $securePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true
    }

    if ($user.Group) {
        Add-ADGroupMember -Identity $user.Group -Members $user.Sam -ErrorAction SilentlyContinue
    }
}

Set-ADAccountControl -Identity "svc.backup" -PasswordNeverExpires $true

