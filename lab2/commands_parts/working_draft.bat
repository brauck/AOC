@ECHO off
if not exist help.txt (help > help.txt)
IF exist lines.bat (del lines.bat)
::wfa calc notepad asdfafa dir /b /a  pause afdafgjkr calc for if

set isArgument=false
set line=%1

shift

::Check if an attribute is a command
:exe
if "%1"=="" goto execute

:: Check if an argument cotains slash (/)
set atr=%1
if not x%atr:/=%==x%atr% (
  set isArgument=true
  goto string
)

:: The programm with this command may exit with errorlevel 1
where /q %1

IF %errorlevel% == 0 (
  set isArgument=false  
  goto string 
  ) else (goto cmd)

:: If the programm must exit with errorlevel 0 use this code
::FOR /F usebackq %%F IN (`where %1`) DO (set command=%%F)
::IF defined command (the same code)

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

echo %line% >> lines.bat
set line=%1
shift
goto exe

:execute
echo %line% >> lines.bat
echo pause >> lines.bat
echo %errorlevel%
::call lines.bat
echo programm completed successful