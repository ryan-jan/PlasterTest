<#
Start-Sleep -Seconds 5
Rename-Item -Path ".\src" -NewName "PlasterTest" -Force -Confirm:$false
$CurModuleVersion = (Import-PowerShellDataFile ".\PlasterTest\PlasterTest.psd1").ModuleVersion
$PrevCommit = (git log --pretty=tformat:"%H")[1]
git checkout -b buildtemp $PrevCommit --quiet
$PrevModuleVersion = (Import-PowerShellDataFile ".\PlasterTest\PlasterTest.psd1").ModuleVersion
git checkout master --quiet
git branch -D buildtemp --quiet

if ($CurModuleVersion -gt $PrevModuleVersion) {
    Write-Output ("Module version increased from $PrevModuleVersion to $CurModuleVersion.`n" +
                  "Publishing new version on PSGallery.")
    Publish-Module -Path "$PSScriptRoot\..\PlasterTest" -NuGetApiKey $env:PSGALLERY_KEY
}
#>

Start-Sleep -Seconds 5
Rename-Item -Path ".\src" -NewName "PlasterTest" -Force -Confirm:$false
$CurModuleVersion = (Import-PowerShellDataFile ".\PlasterTest\PlasterTest.psd1").ModuleVersion
$Tag = (git tag --points-at master)[0]