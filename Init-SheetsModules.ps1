# Init-SheetsModules.ps1
# One-time scaffold for DV Google Sheets & AI Tools modules

$modules = @(
    @{ name = "arena-dashboard";  title = "Arena Dashboard";  desc = "Lightweight dashboard for market metrics and notes."; },
    @{ name = "finance-tracker";  title = "Finance Tracker";  desc = "Minimal finance system for income & expenses."; },
    @{ name = "content-planner";  title = "Content Planner";  desc = "AI-friendly content planning toolkit."; }
)

# Base folder (current repo)
$root = Get-Location
$sheetsRoot = Join-Path $root "sheets"
New-Item -ItemType Directory -Force -Path $sheetsRoot | Out-Null

$nl = "`r`n"

foreach ($m in $modules) {

    $modulePath = Join-Path $sheetsRoot $m.name
    New-Item -ItemType Directory -Force -Path $modulePath | Out-Null

    # ---------- README.md ----------
    $readme  = "# " + $m.title + $nl + $nl
    $readme += "Prototype module from **DV Google Sheets & AI Tools**." + $nl + $nl
    $readme += $m.desc + $nl + $nl
    $readme += "## Files" + $nl + $nl
    $readme += "- `README.md` — module overview and quick notes." + $nl
    $readme += "- `manifest.json` — structure and metadata." + $nl
    $readme += "- `code.gs` — main Google Apps Script logic (entry point)." + $nl + $nl
    $readme += "## Status" + $nl + $nl
    $readme += "- Version: 0.1" + $nl
    $readme += "- Stage: Prototype — will be expanded in future releases." + $nl

    Set-Content -Path (Join-Path $modulePath "README.md") -Value $readme -Encoding UTF8

    # ---------- manifest.json ----------
    $manifest  = "{" + $nl
    $manifest += "  `"name`": `"" + $m.name + "`"," + $nl
    $manifest += "  `"title`": `"" + $m.title + "`"," + $nl
    $manifest += "  `"version`": `"0.1.0`"," + $nl
    $manifest += "  `"stage`": `"prototype`"" + $nl
    $manifest += "}" + $nl

    Set-Content -Path (Join-Path $modulePath "manifest.json") -Value $manifest -Encoding UTF8

    # ---------- code.gs ----------
$code = @"
/**
 * $($m.title) — prototype entry point.
 * Part of DV Google Sheets & AI Tools.
 */
function initModule() {
  Logger.log('Module $($m.title) loaded.');
}
"@
    Set-Content -Path (Join-Path $modulePath "code.gs") -Value $code -Encoding UTF8

    Write-Host ("✔ Module scaffolded: {0}" -f $m.name)
}

Write-Host ("All modules created under: {0}" -f $sheetsRoot)
