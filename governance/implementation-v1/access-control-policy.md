# Access Control Policy

## Purpose

Establish least-privilege access controls for Vybe Collections technology systems and repositories.

## Requirements

- Access must be granted only for legitimate business needs.
- Permissions must follow least-privilege principles.
- Administrative access must be restricted to authorized personnel.
- Authentication must use approved secure mechanisms.
- Multi-factor authentication should be used where available.
- Repository permissions must not be expanded to compensate for unrelated integration failures.
- External integrations must receive only the permissions required for their approved function.

## GitHub Controls

Repository access and external integration authorization are separate controls.

Effective integration authorization must be demonstrated through an approved controlled transaction.

## Review

Access should be reviewed periodically and whenever responsibilities change.

## Prohibited Actions

- Sharing credentials
- Bypassing authorization controls
- Circumventing security restrictions
- Granting unnecessary administrative access
- Using repository permissions as a workaround for integration authorization failures
