# Sips.PowerCli

Pipeable filters built on top of [Sips (Scriptable image processing system)](https://ss64.com/osx/sips.html).

## Usage

- `ConvertTo-SipsJpgExif` — Converts and optimizes images to target format and quality; Doesn't modify original copies
  - `-Quality <0..100>` — Optional, defaults to 40
  - `-OutputDir <Path>` — Optional, defaults to `./processed`
  - `-AcceptExtensions <Array>` — Optional, defaults to `(".jpg", ".jpeg", ".heic", ".png")`

## One-time setup

- `Install-Module Sips.PowerCli`

## Examples

```powershell
PS /Users/<you>/Downloads/icloudphotos>    $files | ConvertTo-SipsJpgExif -Quality 50
(...)

PS /Users/<you>/Downloads/icloudphotos>    Get-ChildItem | ConvertTo-SipsJpgExif | Format-Table

From           To                      FromSize    ToSize      Percent
----           --                      --------    ------      -------
/IMG_1445.PNG  /processed/IMG_1445.jpg 2,248,706 b 73,587 b    3.272%
/IMG_1517.HEIC /processed/IMG_1517.jpg 775,460 b   398,262 b   51.358%
/IMG_1535.JPEG /processed/IMG_1535.jpg 312,154 b   35,092 b    11.242%
/IMG_1536.JPEG /processed/IMG_1536.jpg 14,914 b    4,562 b     30.589%
/IMG_1537.HEIC /processed/IMG_1537.jpg 1,551,384 b 942,011 b   60.721%
/IMG_1542.HEIC /processed/IMG_1542.jpg 1,487,279 b 968,279 b   65.104%
(...)
```

## Integration

- Can be used with other automation tools (e.g. Automator, BTT), for example it can be wired up to be available from Finder

# For maintainers

## Local environment

- Pick a folder from `$env:PSModulePath` and copy or link the module there
- Starting with PS 3.0, modules are automatically imported, so it should work out of the box
- Use `Import-Module Sips.PowerCli -Force` to reload the module, when needed

## Building and publishing

1. Start `build.ps1` to generate a new `.psd1` manifest file
2. Start `publish.ps1` to publish a new version to [PowerShell Gallery](https://www.powershellgallery.com)
