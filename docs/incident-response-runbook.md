# Incident Response Runbook

## Scenario

An attacker compromises a workstation account, performs password spraying, adds a user to a privileged group, and attempts discovery or credential access.

## Triage

1. Identify the alert source, hostname, username, and timestamp.
2. Pull Windows Security, Sysmon, and PowerShell events for a 30-minute window.
3. Run `07-Collect-IR-Triage.ps1` on the suspected host.
4. Check recent group membership changes.
5. Review failed logon sources and target accounts.
6. Identify suspicious process execution and lateral movement indicators.

## Containment

1. Disable the suspected user account.
2. Remove unauthorized privileged group membership.
3. Isolate the workstation from the network.
4. Rotate affected passwords and service account secrets.
5. Block malicious source IPs or hosts if applicable.

## Eradication And Recovery

1. Remove persistence mechanisms.
2. Reimage heavily compromised endpoints.
3. Re-enable accounts only after password reset and review.
4. Validate that detections no longer fire.
5. Document root cause and control improvements.

## Lessons Learned

- Which control failed?
- Which detection worked?
- What telemetry was missing?
- What policy or GPO change would reduce repeat risk?

