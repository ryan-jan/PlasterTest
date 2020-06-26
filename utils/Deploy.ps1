if ($env:APPVEYOR_REPO_TAG -eq "true") {
    Rename-Item -Path ".\src" -NewName "PlasterTest" -Force -Confirm:$false
    $CurModuleVersion = (Import-PowerShellDataFile ".\PlasterTest\PlasterTest.psd1").ModuleVersion
    
    if ($env:APPVEYOR_REPO_TAG_NAME -like "v$($CurModuleVersion.ToString)") {
        Write-Host "Current commit has been tagged with a new version. Pushing to PowerShell Gallery."
        #Publish-Module -Path "$PSScriptRoot\..\PlasterTest" -NuGetApiKey $env:PSGALLERY_KEY
    } else {
        throw "Current commit has been tagged with a new version, but the version differs from that specified in the module manifest."
    }
}