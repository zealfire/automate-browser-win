# disabling access to main user folder access
ICACLS C:\Users\Administrator /setowner "Administrator" /T /C
CACLS C:\Users\Administrator /E /R test

# bottom menu bar is hidden
taskkill /f /im explorer.exe

# right click is disabled
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewContextMenu /t REG_DWORD /d 1 /f

# windows key shortcut is disabled
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWinKeys /t REG_DWORD /d 1 /f
