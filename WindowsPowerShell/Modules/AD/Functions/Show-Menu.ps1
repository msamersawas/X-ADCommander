function Show-Menu {
    param (
        [string]$Title = 'Menu',
        [Parameter(Mandatory=$true)]
        [string[]]$Choices
    )
    $SelectedChoice = 0
    Write-Host "$Title" -ForegroundColor Cyan
    Write-Host "-------------------------------"
    $i = 1
    foreach ($Choice in $Choices) {
        $RandomColor = Get-Random -Minimum 1 -Maximum 15
        Write-Host "$i. $Choice" -ForegroundColor $RandomColor
        $i++
    }
    Write-Host "-------------------------------"
    try {
        [int]$SelectedChoice = Read-Host "`nEnter your choice (1-$($Choices.Count)) or type anything else to quit"
    }
    catch {
        $SelectedChoice = 0
        $SelectedChoice
        Return
    }
    if  ($SelectedChoice -lt 1 -or $SelectedChoice -gt $Choices.Count){
        $SelectedChoice = 0
    }
    $SelectedChoice
}