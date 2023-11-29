@ECHO off

:loop
set str=
if "%1"=="" goto :eof
FOR /F usebackq %%F IN (`findstr /b /i /c:"%1  " help.txt`) DO (
set str=%%F
)

IF defined str (ECHO string %str%)
shift
goto loop