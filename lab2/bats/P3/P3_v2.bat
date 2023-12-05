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

::Check if extension of argument equal .exe
set ifExe=.ext
set ext=%~x1
if defined ext (set ifExe=%ext%)
if %ifExe% == .exe (
  set isArgument=false  
  goto string
)

if defined ext (
  set isArgument=true  
  goto string
)

:: Check if an argument cotains slash (/)
set atr=%1
if not x%atr:/=%==x%atr% (
  set isArgument=true
  goto string
)

:: Quiet mode
::where /q %1

set command=
for /f usebackq %%f in (`where %1`) do (set command=%%f)
IF defined command (
  set isArgument=false  
  goto string 
  ) else (goto cmd)
:: Check if an attribute is a built in command to cmd.exe
:cmd
set str=
for /f usebackq %%F in (`findstr /b /i /c:"%1  " help.txt`) do (
  set str=%%F
)

if defined str (  
  set isArgument=false
  goto string
  ) else (  
  set isArgument=true
  goto string
)

:: Form command line with arguments
:string
if %isArgument% == true (  
  set line=%line% %1
  shift
  goto exe
)

::echo %line% >> lines.bat
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