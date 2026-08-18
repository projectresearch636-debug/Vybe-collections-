# Security Policy

## Purpose

Protect Vybe Collections systems, information, credentials, and operations.

## Mandatory Controls

- Never commit passwords, API keys, access tokens, private keys, or production credentials.
- Use approved secret-management mechanisms.
- Apply least-privilege access.
- Use secure authentication and authorization.
- Protect customer, employee, and company information.
- Maintain appropriate auditability.
- Validate dependencies and configurations.
- Escalate suspected security incidents.

## Repository Security

Never weaken repository security controls merely to make an integration work.

Do not expose credentials through commits, documentation, logs, screenshots, or command output.

## Incident Response

If a credential is exposed:

1. Treat it as compromised.
2. Stop further exposure.
3. Rotate or revoke the credential.
4. Investigate affected systems.
5. Document the incident.
6. Escalate according to company procedures.

## Production Protection

Production systems and credentials require appropriate authorization.

Destructive or irreversible operations require explicit approval.
