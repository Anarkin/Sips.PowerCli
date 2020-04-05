$nextVersion = "1.0.6"
$publicApiFunctions = "ConvertTo-SipsJpgExif"
$desc = "Pipeable filters built on top of Sips (Scriptable image processing system)."
$author = "Adam Lengyel"

New-ModuleManifest `
    -RootModule Sips.PowerCli.psm1 `
    -Path Sips.PowerCli.psd1 `
    -CompatiblePSEditions Core `
    -PowerShellVersion 7.0 `
    -ModuleVersion $nextVersion `
    -FunctionsToExport $publicApiFunctions `
    -Description $desc `
    -CompanyName $author `
    -Author $author
