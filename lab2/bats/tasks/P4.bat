@chcp 65001
@echo off
set /a count=0

if %1 GTR 20 (
  echo Значение должно не превышать 20
  goto :eof
)

:loop
if %count% GTR %1 goto :eof
echo %count%
set /a count+=1
goto loop
