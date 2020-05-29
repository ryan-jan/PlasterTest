# Get public function definition files and dot source them
$PublicPath = Join-Path -Path $PSScriptRoot -ChildPath "public" -AdditionalChildPath "*.ps1"
$PrivatePath = Join-Path -Path $PSScriptRoot -ChildPath "private" -AdditionalChildPath "*.ps1"
$Public = @(Get-ChildItem -Path $PublicPath)
$Private = @(Get-ChildItem -Path $PrivatePath)

foreach ($Module in ($Public + $Private)) {
    try {
        . $Module.FullName
    } catch {
        Write-Error -Message "Failed to import function $($Module.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.BaseName