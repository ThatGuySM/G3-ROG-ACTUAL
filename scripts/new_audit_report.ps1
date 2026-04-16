[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [datetime]$SnapshotDate,

    [string]$OutputPath
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$templatePath = Join-Path $repoRoot "docs/templates/system_health_report_template.md"

if (-not (Test-Path $templatePath -PathType Leaf)) {
    Write-Error "Template not found: $templatePath"
    exit 1
}

if (-not $OutputPath) {
    $fileName = "{0}_system_health_report.md" -f $SnapshotDate.ToString("yyyy-MM-dd")
    $OutputPath = Join-Path $repoRoot "docs/drafts/$fileName"
} elseif (-not [System.IO.Path]::IsPathRooted($OutputPath)) {
    $OutputPath = Join-Path $repoRoot $OutputPath
}

if (Test-Path $OutputPath) {
    Write-Error "Output file already exists: $OutputPath"
    exit 1
}

$content = Get-Content $templatePath -Raw
$content = $content.Replace("YYYY-MM-DD", $SnapshotDate.ToString("yyyy-MM-dd"))

$outputDir = Split-Path -Parent $OutputPath
if (-not (Test-Path $outputDir -PathType Container)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

Set-Content -Path $OutputPath -Value $content -NoNewline

Write-Host "[OK] Created audit draft: $OutputPath" -ForegroundColor Green
Write-Host "[NEXT] Run collect_system_audit.ps1, fill in the draft, then promote it to docs/ when published." -ForegroundColor Cyan
