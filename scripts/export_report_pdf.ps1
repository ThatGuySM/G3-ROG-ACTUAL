[CmdletBinding()]
param(
    [string]$InputMarkdown = "docs/g3ROG-actual_System_Health_Report.md",
    [string]$OutputPdf = "docs/g3ROG-actual_System_Health_Report.pdf"
)

$ErrorActionPreference = "Stop"

function Resolve-RepoPath([string]$PathValue, [string]$RepoRoot) {
    if ([System.IO.Path]::IsPathRooted($PathValue)) {
        return $PathValue
    }

    return Join-Path $RepoRoot $PathValue
}

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$inputPath = Resolve-RepoPath $InputMarkdown $repoRoot
$outputPath = Resolve-RepoPath $OutputPdf $repoRoot
$tempHtml = Join-Path $env:TEMP "g3ROG-actual_System_Health_Report.generated.html"
$edgePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

if (-not (Test-Path $inputPath -PathType Leaf)) {
    Write-Error "Input markdown not found: $inputPath"
    exit 1
}

if (-not (Test-Path $edgePath -PathType Leaf)) {
    Write-Error "Microsoft Edge not found at: $edgePath"
    exit 1
}

$markdown = Get-Content $inputPath -Raw
$body = ($markdown | ConvertFrom-Markdown).Html

$html = @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>g3ROG-actual - System Health Report</title>
  <style>
    body {
      font-family: "Segoe UI", Arial, sans-serif;
      color: #161616;
      margin: 40px auto;
      max-width: 900px;
      line-height: 1.55;
      padding: 0 24px 48px;
    }
    h1, h2 {
      color: #111827;
    }
    h1 {
      border-bottom: 3px solid #d1d5db;
      padding-bottom: 10px;
      margin-bottom: 24px;
    }
    h2 {
      margin-top: 28px;
      border-bottom: 1px solid #e5e7eb;
      padding-bottom: 6px;
    }
    ul {
      padding-left: 22px;
    }
    li {
      margin: 6px 0;
    }
    code {
      font-family: Consolas, "Courier New", monospace;
      background: #f3f4f6;
      padding: 1px 5px;
      border-radius: 4px;
    }
    p, li {
      font-size: 14px;
    }
    @page {
      size: Letter;
      margin: 0.6in;
    }
  </style>
</head>
<body>
$body
</body>
</html>
"@

try {
    Set-Content -Path $tempHtml -Value $html -Encoding utf8

    $htmlUri = [System.Uri]::new($tempHtml).AbsoluteUri
    & $edgePath --headless=new --disable-gpu --print-to-pdf="$outputPath" $htmlUri | Out-Null

    if (-not (Test-Path $outputPath -PathType Leaf)) {
        Write-Error "PDF export did not produce an output file."
        exit 1
    }
}
finally {
    if (Test-Path $tempHtml -PathType Leaf) {
        Remove-Item -LiteralPath $tempHtml -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "[OK] Exported PDF to $outputPath" -ForegroundColor Green
