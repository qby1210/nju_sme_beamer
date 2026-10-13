param(
    [string]$XeLaTeX = 'xelatex'
)

$ErrorActionPreference = 'Stop'
$engine = Get-Command $XeLaTeX -ErrorAction Stop

Push-Location -LiteralPath $PSScriptRoot
try {
    for ($pass = 1; $pass -le 2; $pass++) {
        & $engine.Source '-interaction=nonstopmode' '-halt-on-error' '-file-line-error' '-no-shell-escape' 'main.tex'
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX pass $pass failed. See main.log."
        }
    }
    Write-Output ('PDF: ' + (Join-Path $PSScriptRoot 'main.pdf'))
} finally {
    Pop-Location
}
