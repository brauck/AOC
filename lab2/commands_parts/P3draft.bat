@ECHO off
IF exist lines.bat (del lines.bat)
::wfa calc notepad asdfafa dir /b /a  pause afdafgjkr calc for if

set isCommand=false
set line=

:stage1

if "%1"=="" goto execute
::echo iteration
set command=
FOR /F usebackq %%F IN (`where %1`) DO (
set command=%%F
)

::IF defined command (echo %1 >> lines.bat) else (goto stage2)
IF defined command (
  set line=%1
  echo %1 >> lines.bat
) else (goto stage2)
::echo %1 >> lines.bat
shift
goto stage1

:stage2
set str=
if "%1"=="" goto :eof
FOR /F usebackq %%F IN (`findstr /b /i /c:"%1  " help.txt`) DO (
set str=%%F
)

::IF defined str (ECHO %1 >> lines.bat) else (goto stage3)
IF defined str (
  set line=%1
  echo %1 >> lines.bat
) else (goto stage3)
::echo %1 >> lines.bat
shift
goto stage1

:stage3
set line=%line% %1
echo %line% >> lines.bat
shift
goto stage1

:execute
echo %errorlevel%
::call lines.bat
::echo %line%
echo is the end