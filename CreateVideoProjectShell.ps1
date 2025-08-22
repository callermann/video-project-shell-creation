$subDirs = "After Effects", "Clips", "Exports", "Images", "Music", "Sound Effects", "Thumbnails"


if($args.Count -eq 1) {
    Write-Host "No Paths Specified"
}
else {

    for ($i=1; $i -lt $args.Count; $i++) {
        $basePath = $args[$i]
        if(Test-Path -Path $basePath -PathType Container) {
            Write-Host -ForegroundColor Green "Creating Subdirectories in '$basePath'"
            foreach($subDir in $subDirs) {
                $newPath = Join-Path $basePath -ChildPath $subDir
                if(Test-Path -Path $newPath) {
                    Write-Host -ForegroundColor Red "  - Skipping existing subdirectory $subDir"
                }
                else {
                    Write-Host -ForegroundColor Green "  - Creating Subdirectory: $subDir"
                    New-Item -Path $newPath -ItemType Directory | Out-Null
                }

            }

        }
        else {
            Write-Host -ForegroundColor Red "Basepath: '$basePath' is not a directory, skipping"
        }
    }
}

Read-Host "Press Enter to continue..."