@echo off

echo skip killing browsers and drivers? %SKIP_TASKKILL%
if "%SKIP_TASKKILL%" neq "true" (
    taskkill /F /T /IM chrome.exe
    taskkill /F /T /IM chromedriver.exe
    taskkill /F /T /IM firefox.exe
    taskkill /F /T /IM iexplore.exe
)

echo skip zap? %SKIP_ZAP_RESTART%
if "%SKIP_ZAP_RESTART%" equ "true" exit 0


taskkill /F /T /IM javaw.exe

start /D "C:\Program Files (x86)\OWASP\Zed Attack Proxy\" ZAP.exe

set /A tries=1
set /A maxtries=20

:loop
	netstat /A > netstat.txt

	find /C ":9998 " netstat.txt
	if %errorlevel% equ 0 goto done
	if %tries% equ %maxtries% goto bail
	
	echo.
	echo try #%tries%, ZAP not started yet
	set /A tries+=1
	ping -n 5 127.0.0.1 > nul
goto loop


:bail
taskkill /F /T /IM javaw.exe
echo.
echo.
echo.
echo ^*^*^*^*^*^*^*^*^*
echo ^>^> ZAP still not started, bailing!
echo ^*^*^*^*^*^*^*^*^*
echo.
exit 1

:done
powershell -command "& { $x = New-Object -ComObject Shell.Application; $x.minimizeall() }"
echo.
echo.
echo.
echo ^*^*^*^*^*^*^*^*^*
echo ^>^> ZAP started!
echo ^*^*^*^*^*^*^*^*^*
echo.
exit 0
