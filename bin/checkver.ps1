param(
    [String] $App = '*',
    [String] $Dir = "$psscriptroot\..\bucket",
    [Parameter(ValueFromRemainingArguments = $true)]
    [String[]] $Rest = @()
)

begin {
    if (-not $env:SCOOP_HOME) { $env:SCOOP_HOME = Resolve-Path (scoop prefix scoop) }
    $Dir = Resolve-Path $Dir
    $Script = "$env:SCOOP_HOME\bin\checkver.ps1"
    $Rest = $Rest -join ' '
}

process {
    foreach ($aan in $App) { Invoke-Expression -Command "$Script -App ""$app"" -Dir ""$Dir"" $Rest" }
}

end { Write-Host 'DONE' -ForegroundColor Yellow }
