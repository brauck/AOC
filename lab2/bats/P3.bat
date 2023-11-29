@echo off
:getprogramme
if "%1"=="" goto end
%1
shift
goto getprogramme
:end
echo work is end