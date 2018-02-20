control desk.cpl,Web,0

control powercfg.cpl

taskkill /F /IM "OneDrive.exe"

cd %windir%\syswow64

OneDriveSetup.exe /uninstall

rundll32 newdev.dll,DeviceInternetSettingUi

#Отключение автоматического восстановления Windows
bcdedit /set {default} recoveryenabled no

#Отключение восстановления Windows при загрузке
bcdedit /set bootstatuspolicy ignoreallfailures

#Отключение сообщения о критической ошибке приложенияreg 
add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v DontShowUI /t REG_DWORD /d 1 /f

#Убрать переход в спящий режим
powercfg /change /standby-timeout-ac 0

#Убрать отключение дисплея 
powercfg /change /monitor-timeout-ac 0

#Увеличение объема файла подкачки
wmic pagefileset create name="С:\pagefile.sys"wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16384,MaximumSize=16384

#Разрешение запуска powershell скриптовpower
shell -nologo -noprofile Set-ExecutionPolicy Bypass -Force

#Добавление майнера в автозагрузку
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v MINER /t reg_sz /d "C:\miner\eth.bat"

#отключить
net stop "dmwappushsvc"
sc config "dmwappushsvc" start= disabled

#отключить Background Intelligent Transfer Service
net stop "BITS"
sc config "BITS" start= disabled

#отключить Connected User Experiences and Telemetry
net stop "DiagTrack"
sc config "DiagTrack" start= disabled

#отключить Geolocation Service
net stop "lfsvc"
sc config "lfsvc" start= disabled

#отключить Print Spooler
net stop "Spooler"
sc config "Spooler" start= disabled

#отключить SSDP Discovery
net stop "SSDPSRV" 
sc config "SSDPSRV" start= disabled

#отключить Windows Audio
net stop "Audiosrv"
sc config "Audiosrv" start= disabled

#отключить Windows Audio Endpoint Builder
net stop "AudioEndpointBuilder"
sc config "AudioEndpointBuilder" start= disabled

#отлкючить Windows Error Reporting Service
net stop "WerSvc"
sc config "WerSvc" start= disabled

#отключить Windows Search
net stop "WSearch"
sc config "WSearch" start= disabled

#отключить Windows Update
net stop "wuauserv"
sc config "wuauserv" start= disabled

