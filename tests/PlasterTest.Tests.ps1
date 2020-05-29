InModuleScope "PlasterTest" {
    Describe "Module Manifest Tests" {
        $ModuleManifestPath = "$PSScriptRoot\..\src\PlasterTest.psd1"
        It "Passes Test-ModuleManifest" {
            Test-ModuleManifest -Path $ModuleManifestPath | Should Be $true
        }
    } 
}
