@chcp 65001
@echo off

if %1 == Редактор (
  edit
  goto :eof
)

if %1 == Память (
  mem %2
  goto :eof
)

if %1 == Директория (
  dir %2 > %3\dir_3.txt
)