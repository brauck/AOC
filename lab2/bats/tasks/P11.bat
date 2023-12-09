@chcp 65001
@echo off
set /a count=0

:loop
set attr=
set /a count+=1
if %count% GTR 5 goto :eof
if [%1]==[] goto :eof
set attr=%~a1
if defined attr (
  dir %1
  shift
  goto loop
)
echo Папка %1 не найдена
shift
goto loop