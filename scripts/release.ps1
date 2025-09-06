Param(
    [Parameter(Mandatory=$true)][string]$Version,   # e.g., v1.1.0
    [Parameter(Mandatory=$true)][string]$Notes      # short summary
)

function Step($m){ Write-Host ">> $m" -ForegroundColor Cyan }
function Ok($m){ Write-Host "[OK] $m" -ForegroundColor Green }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Err($m){ Write-Host "[ERR] $m" -ForegroundColor Red }

# Pre-checks
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { Err "Git not found"; exit 1 }

# Ensure we're in a git repo
if (-not (Test-Path ".git")) { Err "Not a git repo. Run inside your repo root."; exit 1 }

# Create release branch
$branch = "release/$Version"
Step "Creating branch $branch"
git checkout -b $branch 2>$null

# Stage common paths
git add docs/* benchmarks/* logs/* CHANGELOG.md README.md 2>$null

# Commit
if (git status --porcelain) {
  Step "Committing changes"
  git commit -m "$Version: $Notes" | Out-Null
} else {
  Warn "No changes detected to commit"
}

# Push branch
Step "Pushing branch $branch"
git push -u origin $branch

Warn "Open a Pull Request on GitHub for $branch, review and merge when green."
Read-Host "Press ENTER after PR is merged to continue tagging"

# Sync main and tag
Step "Syncing main"
git checkout main
git pull

Step "Tagging $Version"
git tag $Version -m "G3-ROG-ACTUAL $Version — $Notes"
git push --tags

Ok "Done. Tagged $Version."
