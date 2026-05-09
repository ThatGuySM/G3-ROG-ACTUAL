# AIDA64 Sources

This folder stores **sanitized, repo-safe AIDA64-derived documentation** for the g3ROG build dossier.

## Current Source

- [AIDA64-Report-20260509_v2-clean-source.md](AIDA64-Report-20260509_v2-clean-source.md) — sanitized source-of-truth summary for G3ROG-DARK.

## Privacy Rules

Do not commit raw AIDA64 exports or unreviewed hardware dumps. Public docs must exclude:

- Drive serial numbers
- Display serial numbers
- MAC addresses
- IP addresses, DHCP details, gateways, and DNS details
- UUIDs / GUIDs
- Windows user profile paths
- Product IDs, activation data, and license keys
- Raw device instance paths
- Full raw dump content that is not needed for documentation
- Personally identifying metadata unrelated to the hardware record

## Publication Workflow

1. Generate or receive a local AIDA64 report.
2. Create a sanitized Markdown summary before committing anything.
3. Remove private identifiers and raw dump sections.
4. Use the sanitized summary to update `README.md`, `docs/g3ROG-DARK-spec.md`, `docs/bios-settings.md`, and `docs/stability-validation.md`.
5. Keep validation results separate from inventory snapshots unless a test has actually been run.

## Notes

The 2026-05-09 source confirms the corrected G3ROG-DARK CPU topology after SMT was restored: Ryzen 7 9850X3D is visible as 8 physical cores and 16 logical processors.
