param($dir)

start $dir\setup.exe -wait

:: ClickOnce installer will start MTGO right away, let's stop it right away too

:: wait until MTGO has started
$started = $false
Do {
    $status = Get-Process notepad -ErrorAction SilentlyContinue
    If (!($status)) { Write-Host 'Waiting for process to start' ; Start-Sleep -Seconds 1 }
    Else { Write-Host 'Process has started' ; $started = $true }
}
Until ( $started )

:: then close it
Stop-Process -Name mtgo
