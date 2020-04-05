#Requires -Version 7

function ConvertTo-SipsJpgExif(
    [int] $Quality = 40,
    [string] $OutputDir = "./processed",
    [string[]] $AcceptExtensions = @(".jpg", ".jpeg", ".heic", ".png")
) {
    begin {
        Test-OutDir -OutputDir $OutputDir
    }

    process {
        $inFile = $_
        if ($inFile.Extension -notin $AcceptExtensions) {
            return
        }

        $outFileName = Join-Path -Path $OutputDir -ChildPath "$($inFile.BaseName).jpg"

        sips -s format jpeg -s formatOptions $Quality $inFile.FullName --out $outFileName > $null

        $outFile = Get-Item $outFileName

        $fromSize = $inFile.Length.ToString("N0")
        $toSize = $outFile.Length.ToString("N0")
        $percent = ($toSize / $fromSize).ToString("P")

        return [PSCustomObject]@{
            From     = $inFile
            To       = $outFile
            FromSize = "$fromSize b"
            ToSize   = "$toSize b"
            Percent  = $percent
        }
    }
}

# internal

function Test-OutDir(
    $OutputDir
) {
    if (!(Test-Path -Path $OutputDir)) {
        New-Item -Path $OutputDir -ItemType "directory" > $null
    }
    else {
        $existingFiles = Get-ChildItem -Path $OutputDir
        if ($existingFiles.Count -gt 0) {
            Write-Host "output folder is not empty"
            break
        }
    }
}
