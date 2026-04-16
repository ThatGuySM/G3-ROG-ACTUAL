# Docs Hub

This folder is the public documentation center for G3-ROG-ACTUAL.
If you are visiting the repo for the first time, start with `LATEST.md`.

## Start Here

- [Latest audit entrypoint](LATEST.md)
- [Current system health report](G3-ROG-ACTUAL_System_Health_Report.md)
- [Current PDF report](G3-ROG-ACTUAL_System_Health_Report.pdf)
- [Battlestation spec sheet](G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md)
- [Visual gallery](GALLERY.md)
- [BIOS tuning notes](../bios/g3rog_actual_bios_full_profile.md)

## Folder Layout

- `drafts/`: in-progress report drafts that have not been published yet
- `archive/`: older reports and retired published snapshots
- `templates/`: reusable templates for future report updates
- root of `docs/`: current public-facing reports and reference docs

## Publishing Flow

1. Run `pwsh ../scripts/new_audit_report.ps1 -SnapshotDate YYYY-MM-DD` to create a draft in `drafts/`.
2. Use `pwsh ../scripts/collect_system_audit.ps1` to gather fresh local system data into `logs/audits/`.
3. Fill in the draft and review it for any sensitive details before publication.
4. Save the current public report into `archive/` before replacing it.
5. Run `pwsh ../scripts/export_report_pdf.ps1` to regenerate the PDF from the published markdown.
6. Publish the updated Markdown and PDF in the root of `docs/`.
7. Update `LATEST.md` so visitors always land on the newest snapshot first.

## Notes

- `G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md` is the single published hardware inventory for the repo.
- Treat everything here as publishable public content.
- Redact usernames, serial numbers, keys, local network details, and anything else you would not want indexed publicly.
