@ECHO off
if not exist help.txt (help > help.txt)
IF exist lines.bat (del lines.bat)
::wfa calc notepad asdfafa dir /b /a  pause afdafgjkr calc for if
set isCommand=true
set isArgument=false
set command=%1
set line=%1


:exe
::echo arg is %isArgument%

if "%1"=="" goto execute

::FOR /F usebackq %%F IN (`where %1`) DO (set com=%%F)
::IF defined com (code)

where /q %1

::IF defined command (echo %1 >> lines.bat) else (goto cmd)
IF %errorlevel% == 0 (
  set isCommand=true
  set isArgument=false
  
  goto string 
) else (goto cmd)
::echo %1 >> lines.bat
::shift
::goto exe

:cmd
::echo in cmd
set str=
::if "%1"=="" goto :eof
FOR /F usebackq %%F IN (`findstr /b /i /c:"%1  " help.txt`) DO (
set str=%%F
)

::IF defined str (ECHO %1 >> lines.bat) else (goto stage3)
IF defined str (
  set isCommand=true
  set isArgument=false
  goto string
) else (
  set isCommand=false
  set isArgument=true
  goto string
)
::echo %1 >> lines.bat
::shift

:string

if %isArgument% == true (
  echo in if isArgument
  set line=%line% %1
  shift
  goto exe
) 
echo arg %1
echo line %line%
echo %line% >> lines.bat
set line=%1
shift

goto exe

:stage4



:execute
echo %errorlevel%
::call lines.bat
::echo %line%
echo is the end