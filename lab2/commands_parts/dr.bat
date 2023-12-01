@ECHO off

if not exist help.txt (help > help.txt)
IF exist lines.bat (del lines.bat)

set isArgument=false
set /a arrLength=0
set line=%1
set arr[]=

shift

::Check if an argument is a command
:exe
if "%1"=="" goto execute

::Check if extension of argument equal .exe
set ifExe=.ext
set ext=%~x1
if defined ext (set ifExe=%ext%)
if %ifExe% == .exe (
  set isArgument=false  
  goto string
)

:: Check if an argument cotains slash (/)
set atr=%1
if not x%atr:/=%==x%atr% (
  set isArgument=true
  goto string
)

:: The programm with this command may exit with errorlevel 1
::where /q %1

:: If the programm must exit with errorlevel 0 use this code
::FOR /F usebackq %%F IN (`where %1`) DO (set command=%%F)
::IF defined command (the same code)

FOR /F usebackq %%F IN (`where %1`) DO (set command=%%F)
IF defined command (
  set isArgument=false  
  goto string 
  ) else (goto cmd)
:: Check if an attribute is a built in command to cmd.exe
:cmd
set str=
FOR /F usebackq %%F IN (`findstr /b /i /c:"%1  " help.txt`) DO (
set str=%%F
)

IF defined str (  
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
::echo %line% >> lines.bat
set arr[%arrLength%]=%line%
echo %arrLength%

setlocal enabledelayedexpansion
for /l %%n in (0,1,5) do ( 
   echo !arr[%%n]! 
)
endlocal

echo %errorlevel%
::call lines.bat
echo programm completed successful