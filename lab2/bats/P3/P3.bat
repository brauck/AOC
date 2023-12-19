@chcp 65001
@echo off

if not exist help.txt (help > help.txt)
if exist lines.bat (del lines.bat)

set isArgument=false
set line=%1

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

:: The programm with this command may exit with errorlevel 1
where /q %1

if %errorlevel% == 0 (goto isArgumentFalse) else (goto cmd)

:: Alternative way
::for /f usebackq %%f in (`where %1`) do (set command=%%f)
::if defined command (the same code)

:: Check if an argument is a built in command to cmd.exe
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

echo %line% >> lines.bat
set line=%1
shift
goto exe

:execute
::Echo last line
echo %line% >> lines.bat
echo pause >> lines.bat
::echo %errorlevel%
call lines.bat
del help.txt
echo programm completed successful

:: As command `where` may set errorlevel > 0,
:: the programm explicitly exits with 0,
:: because thats not an error of the programm.
exit /b 0

:isArgumentTrue
set isArgument=true
goto string

:isArgumentFalse
set isArgument=false  
goto string
