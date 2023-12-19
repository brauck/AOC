@chcp 65001
@echo off

set attr=%~a1
if not defined attr (
  echo Папка %1 не найдена
  goto :eof
)

:loop
if [%2]==[] goto :eof
copy %2 %1
shift /2
goto loop