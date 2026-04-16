# Contributing to g3ROG-actual Audit Repo

Thanks for helping keep this battlestation repo clean, useful, and trustworthy.

## What belongs here

- `docs/`: published health reports, summaries, and export-ready documentation
- `benchmarks/`: benchmark exports, screenshots, and result summaries
- `logs/`: sanitized logs that help explain system behavior
- `bios/`: BIOS notes, profiles, and tuning guides
- `scripts/`: repeatable repo maintenance and validation helpers

## Contribution rules

- Keep the README as a high-level summary and link out to deeper reports instead of duplicating large blocks of data.
- When you update time-sensitive data, note the snapshot date in the edited document.
- Redact serial numbers, license keys, local usernames, hostnames, and anything else you would not want indexed publicly.
- Prefer descriptive filenames with dates or versions when adding new reports or benchmarks.
- Update `CHANGELOG.md` for meaningful repo changes.

## Before opening a PR

- Run `pwsh ./scripts/validate_repo.ps1`
- Review new logs and exports for sensitive information
- Make sure links in `README.md` still point to the latest report files

## Publishing new audits

- Add new long-form reports under `docs/` and move superseded versions into `docs/archive/`.
- Use `docs/drafts/` for work-in-progress reports that are not ready to publish.
- Keep `docs/LATEST.md` updated so visitors always have one stable place to start.
- Use `docs/templates/system_health_report_template.md` when creating a new report from scratch.
- Use `pwsh ./scripts/new_audit_report.ps1 -SnapshotDate YYYY-MM-DD` if you want a dated draft scaffolded automatically.
- Use `pwsh ./scripts/collect_system_audit.ps1` to gather fresh local inventory and security data before writing the next report.
