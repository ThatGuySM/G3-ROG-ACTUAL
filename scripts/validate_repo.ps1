[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

function Fail([string]$Message) {
    Write-Error $Message
    exit 1
}

function Pass([string]$Message) {
    Write-Host "[OK] $Message" -ForegroundColor Green
}

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$requiredFiles = @(
    "README.md",
    "LICENSE",
    "CONTRIBUTING.md",
    "CHANGELOG.md",
    "docs/README.md",
    "docs/LATEST.md",
    "docs/G3-ROG-ACTUAL_System_Health_Report.md",
    "docs/G3-ROG-ACTUAL_System_Health_Report.pdf",
    "docs/G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md",
    "docs/archive/README.md",
    "docs/drafts/README.md",
    "docs/templates/system_health_report_template.md",
    "assets/images/banner-2026-04-16.png",
    "scripts/collect_system_audit.ps1",
    "scripts/export_report_pdf.ps1",
    "scripts/init_repo.ps1",
    "scripts/new_audit_report.ps1",
    "scripts/release.ps1"
)

$requiredDirs = @(
    "assets",
    "benchmarks",
    "bios",
    "docs",
    "logs",
    "scripts"
)

foreach ($path in $requiredFiles) {
    if (-not (Test-Path $path -PathType Leaf)) {
        Fail "Missing required file: $path"
    }
}

foreach ($path in $requiredDirs) {
    if (-not (Test-Path $path -PathType Container)) {
        Fail "Missing required directory: $path"
    }
}

$readme = Get-Content "README.md" -Raw
$docsHub = Get-Content "docs/README.md" -Raw
$latest = Get-Content "docs/LATEST.md" -Raw
$report = Get-Content "docs/G3-ROG-ACTUAL_System_Health_Report.md" -Raw

$readmeChecks = @(
    "Snapshot Notice",
    "[Latest audit entrypoint](docs/LATEST.md)",
    "[Documentation hub](docs/README.md)",
    "[Battlestation spec sheet](docs/G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md)",
    "[BIOS profile notes](bios/g3rog_actual_bios_full_profile.md)"
)

$docsHubChecks = @(
    "[Latest audit entrypoint](LATEST.md)",
    "[Battlestation spec sheet](G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md)",
    "archive/",
    "drafts/",
    "templates/"
)

$latestChecks = @(
    "stable entrypoint",
    "[Markdown system health report](G3-ROG-ACTUAL_System_Health_Report.md)",
    "[Battlestation spec sheet](G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md)"
)

$reportChecks = @(
    "## Audit Snapshot",
    "point-in-time snapshot"
)

foreach ($check in $readmeChecks) {
    if (-not $readme.Contains($check)) {
        Fail "README.md is missing expected content: $check"
    }
}

foreach ($check in $docsHubChecks) {
    if (-not $docsHub.Contains($check)) {
        Fail "docs/README.md is missing expected content: $check"
    }
}

foreach ($check in $latestChecks) {
    if (-not $latest.Contains($check)) {
        Fail "docs/LATEST.md is missing expected content: $check"
    }
}

foreach ($check in $reportChecks) {
    if (-not $report.Contains($check)) {
        Fail "docs/G3-ROG-ACTUAL_System_Health_Report.md is missing expected content: $check"
    }
}

Pass "Required files and directories are present"
Pass "README.md includes current navigation and snapshot guidance"
Pass "Docs hub and latest-audit entrypoint are present"
Pass "System health report includes an audit snapshot notice"
