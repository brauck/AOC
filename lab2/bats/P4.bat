@echo off

:loop
if "%1"=="" goto :eof

call p2.bat %1 %2
shift
shift
goto loop