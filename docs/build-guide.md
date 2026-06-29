# Build Guide

## Prerequisites

- Isolated host-only or NAT lab network
- Windows Server evaluation media or licensed lab images
- Windows 11 Enterprise evaluation media or licensed lab image
- Optional: VirtualBox and Vagrant
- Optional: Wazuh server for detection validation

## Build Order

1. Create the lab network `10.10.20.0/24`.
2. Build `DC01` and assign `10.10.20.10`.
3. Run `01-Install-ADForest.ps1` on `DC01`.
4. Run `02-Configure-OUs-And-Groups.ps1`.
5. Run `03-Create-Lab-Users.ps1`.
6. Join `FS01` and `WS01` to `corp.local`.
7. Apply `04-Apply-Security-Baseline.ps1` and link the GPO after validation.
8. Copy `security/sysmon/sysmon-config.xml` to each Windows host and run `05-Install-Sysmon.ps1`.
9. Configure Wazuh agent collection for Windows Security, PowerShell, and Sysmon logs.
10. Import `security/wazuh/ad-lab-rules.xml` into Wazuh.
11. Run the simulations in `attack-simulations/`.
12. Use `07-Collect-IR-Triage.ps1` during investigations.

## Safety Notes

- Do not run attack simulations on a real corporate domain.
- Use isolated lab credentials only.
- Do not expose the lab domain controller to the internet.
- Snapshot VMs before attack simulation.

