# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Changed

- Refined the README with a clearer maintenance flow for future audit updates

### Added

- `docs/GALLERY.md` plus tracked speed-test proof images under `assets/gallery/`

## [1.1.0] - 2026-04-15

### Changed

- Reworked repo validation so GitHub Actions runs real checks instead of placeholder jobs
- Clarified that the public system report is a point-in-time snapshot
- Improved repo scaffolding, contribution guidance, and issue/PR templates
- Added a stable latest-audit navigation flow and documentation hub
- Published the 2026 markdown audit snapshot and archived the older 2025 markdown report
- Refreshed the README, spec sheet, BIOS notes, and network data to match the 2026 snapshot
- Added a local PDF export script and regenerated the main report PDF from the published markdown

### Added

- `docs/LATEST.md` as a stable entrypoint for the latest published audit
- `docs/README.md` and `docs/archive/README.md` for documentation navigation
- `docs/drafts/README.md` and a scaffolded 2026 draft workflow
- `docs/G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md` as a tracked public spec sheet
- `docs/templates/system_health_report_template.md` for future report creation
- `logs/audits/2026-04-15/` as the sanitized local audit evidence set for the published 2026 snapshot
- `scripts/collect_system_audit.ps1`, `scripts/export_report_pdf.ps1`, `scripts/new_audit_report.ps1`, `scripts/validate_repo.ps1`, `.pre-commit-config.yaml`, and `.yamllint.yml`

### Removed

- Accidental tracked workspace file `G3-ROG-ACTUAL.code-workspace`

## [1.0.0] - 2025-09-05

### Added

- Initial public release of **G3-ROG-ACTUAL Audit Repo**
- README with badges & system overview
- docs/: System Health Report (PDF + MD)
- assets/: Clean banner (GitHub-ready)
- scripts/, logs/, benchmarks/ scaffolds
- .github/: CI workflows (lint, spellcheck, link-check, PDF check) + issue/PR templates
- CONTRIBUTING.md and MIT LICENSE
