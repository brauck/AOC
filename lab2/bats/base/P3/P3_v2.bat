@chcp 65001
@echo off

if not exist help.txt (help > help.txt)

set isArgument=false
set /a arrLength=0
set line=%1
set arr[]=

shift

::Check if an argument is a command
:exe
if [%1]==[] goto execute

::Check if extension of argument is equal .exe
set ifExe=.ext
set ext=%~x1
if defined ext (set ifExe=%ext%)
if %ifExe% == .exe (goto isArgumentFalse)

if defined ext (goto isArgumentTrue)

:: Check if an argument cotains slash (/)
set atr=%1
if not x%atr:/=%==x%atr% (goto isArgumentTrue)

:: Quiet mode
::where /q %1

set command=
for /f usebackq %%f in (`where %1`) do (set command=%%f)
IF defined command (goto isArgumentFalse) else (goto cmd)

:: Check if an attribute is a built in command to cmd.exe
:cmd
set str=
for /f usebackq %%f in (`findstr /b /i /c:"%1  " help.txt`) do (
set str=%%f
)

if defined str (goto isArgumentFalse) else (goto isArgumentTrue)

:: Form command line with arguments
:string
if %isArgument% == true (  
  set line=%line% %1
  shift
  goto exe
)

set arr[%arrLength%]=%line%
set /a arrLength+=1
set line=%1
shift
goto exe

:execute
::insert last line
set arr[%arrLength%]=%line%
::echo %arrLength%

setlocal enabledelayedexpansion
for /l %%n in (0,1,%arrLength%) do ( 
   echo !arr[%%n]!
)

for /l %%n in (0,1,%arrLength%) do ( 
   !arr[%%n]!
)
endlocal

del help.txt
echo programm completed successful
exit /b 0

:isArgumentTrue
set isArgument=true
goto string

:isArgumentFalse
set isArgument=false  
goto string