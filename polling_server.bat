:loop
echo.printed
FOR /F "tokens=5" %%i in ('netstat -aon ^| findstr 8003') do SET PID=%%i
if "%PID%"=="" (CALL :start_server)
SET PID=
ping localhost -n 11 > null
goto loop

:start_server
echo testing
set PATH_TO_RUBY=C:\Ruby24-x64\bin
set RUBY=%PATH_TO_RUBY%\ruby.exe
set PATH_TO_SCRIPTS=C:\Users\Administrator\Desktop\automate-browser-win
start %RUBY% %PATH_TO_SCRIPTS%\service.rb
EXIT /B 0