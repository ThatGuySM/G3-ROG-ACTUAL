# 2026 Audit Publication Checklist

Use this sheet to finish the 2026 report in one pass.

## Fill These In

- Export the final 2026 PDF from the published markdown

## Export From HWiNFO or Your Sensor Tool

- Optional higher-fidelity sensor export if you want hotspot or extra board telemetry beyond the current AIDA64 snapshot

## Export From AIDA64 or Your Benchmark Tool

- Already captured from the 2026-04-15 AIDA64 report

## Security Review

- Keep the firewall wording aligned with your intentional domain-network choice
- Confirm Windows Defender status still matches the 2026-04-15 collection
- Check whether any new security tooling should be mentioned

## BIOS Review

- Keep the restored profile represented as-is unless you intentionally change it again
- Call out any settings you consider intentional exceptions versus old tuning-guide assumptions

## Privacy Review

- Do not publish the raw full AIDA64 HTML report as-is
- Keep internal IPs, MAC addresses, certificate inventories, usernames, and update-history noise out of the public repo

## Publication Pass

- Update [2026-04-15_system_health_report.md](2026-04-15_system_health_report.md)
- Export the final PDF to `docs/`
- Archive the older 2025 report in `docs/archive/`
- Promote the finished 2026 report into the root of `docs/`
- Update `docs/LATEST.md`
