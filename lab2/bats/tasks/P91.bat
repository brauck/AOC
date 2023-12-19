@chcp 65001
@echo off

if [%1]==[] goto end
if [%2]==[] goto end

if [%3]==[] (
  find "%2" %1 | sort > con
  goto eof
)

find "%2" %1 | sort > %3
goto :eof

:end
echo Должно быть два либо три параметра