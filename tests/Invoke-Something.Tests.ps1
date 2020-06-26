InModuleScope "PlasterTest" {
    Describe "Invoke-Something" {
        It "Returns True" {
            Invoke-Something | Should Be $true
        }
    } 
}