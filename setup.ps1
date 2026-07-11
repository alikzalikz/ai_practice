param(
    [Parameter(Mandatory = $true)]
    [string]$Target
)

# Make sure C:\Courses exists
$root = "C:\Courses"
if (!(Test-Path $root)) {
    New-Item -ItemType Directory -Path $root | Out-Null
}

# Use the target folder's name as the junction name
$courseName = Split-Path $Target -Leaf
$linkPath = Join-Path $root $courseName

# Remove existing junction if it exists
if (Test-Path $linkPath) {
    Remove-Item $linkPath -Force
}

# Create junction
New-Item -ItemType Junction -Path $linkPath -Target $Target | Out-Null

Write-Host ""
Write-Host "Created:"
Write-Host "  $linkPath"
Write-Host "      ->"
Write-Host "  $Target"