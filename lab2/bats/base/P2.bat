@chcp 65001
@echo off

if [%2]==[] goto twoArg         :: Не достаточно аргументов
if not exist %1 goto file       :: Файл не найден
if exist %1\NUL goto file       :: Это папка
if not exist %2\NUL goto folder :: Папка не найдена

copy %1 %2\%~n0%~x1
goto :eof

:twoArg
echo Нужно ввести два аргумента
exit /b 1
:file
echo Файл не найден
exit /b 1
:folder
echo Папка не найдена
exit /b 1



