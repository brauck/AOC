@chcp 65001
@echo off

if [%1]==[] goto con
if exist %1 (del %1)
echo %PROCESSOR_ARCHITECTURE% >> %1
echo %PROCESSOR_LEVEL% >> %1
ver >> %1
echo %COMPUTERNAME% >> %1 
echo %USERNAME%>> %1
goto :eof

:con
echo %PROCESSOR_ARCHITECTURE%
echo %PROCESSOR_LEVEL%
ver
echo %COMPUTERNAME%
echo %USERNAME%