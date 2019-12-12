$UninstallString = Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall | foreach-object {Get-ItemProperty $_.PsPath} | ? { $_.displayname -match "Magic The Gathering Online" } | select uninstallstring
cmd /c $UninstallString.UninstallString
