# Publish Elliah Gents Salon to GitHub
# Run this script AFTER installing Git: https://git-scm.com/download/win
# Usage: .\publish-to-github.ps1

$ErrorActionPreference = "Stop"
$repoUrl = "https://github.com/alkhudarigroupuae/elliah-salon.git"

Set-Location $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git is not installed or not in PATH." -ForegroundColor Red
    Write-Host "Install from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

if (-not (Test-Path .git)) {
    Write-Host "Initializing git repository..." -ForegroundColor Cyan
    git init
}

$remotes = git remote 2>$null
if ($remotes -notmatch "origin") {
    Write-Host "Adding remote origin: $repoUrl" -ForegroundColor Cyan
    git remote add origin $repoUrl
} else {
    Write-Host "Setting remote origin URL to: $repoUrl" -ForegroundColor Cyan
    git remote set-url origin $repoUrl
}

Write-Host "Adding all files..." -ForegroundColor Cyan
git add -A
Write-Host "Committing..." -ForegroundColor Cyan
git commit -m "Elliah Gents Salon - expense tracker for salon" 2>$null
if ($LASTEXITCODE -ne 0) { git commit -m "Elliah Gents Salon - expense tracker for salon" }
Write-Host "Pushing to GitHub (main branch)..." -ForegroundColor Cyan
git branch -M main
git push -u origin main

Write-Host "Done! Repository: $repoUrl" -ForegroundColor Green
