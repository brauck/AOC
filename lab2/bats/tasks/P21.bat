@chcp 65001
@echo off
set /a count=0

:loop
set /a count+=1
if %count% GTR 15 goto :eof
if [%1]==[] goto :eof
set attr=%~a1
echo Запуск программы № %count%: %1
timeout /t 3 /nobreak
%1
shift
goto loop