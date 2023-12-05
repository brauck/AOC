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

:: The programm with this command may exit with errorlevel 1
where /q %1

if %errorlevel% == 0 (
  set isArgument=false  
  goto string 
  ) else (goto cmd)

:: Alternative way
::for /f usebackq %%f in (`where %1`) do (set command=%%f)
::if defined command (the same code)

:: Check if an argument is a built in command to cmd.exe
:cmd
set str=
for /f usebackq %%f in (`findstr /b /i /c:"%1  " help.txt`) do (
set str=%%f
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

echo %line% >> lines.bat
set line=%1
shift
goto exe

:execute
::Echo last line
echo %line% >> lines.bat
echo pause >> lines.bat
echo %errorlevel%
call lines.bat
del help.txt
echo programm completed successful