param(
    [string]$RutaPHP = 'php'
)

$archivoOrigen = Join-Path $PSScriptRoot 'ORIGEN\INDEX.PHP'
$aechivoDestino = Join-Path $PSScriptRoot 'PRUEBAS\INDEX.PHP'

php -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hay un error de sintaxis. No se publicó el cambio."
    exit 1
}
Copy-Item $archivoOrigen $aechivoDestino -Force -ErrorAction Stop
Write-Host "Versión publicada en el ambiente de pruebas."