@ECHO off
IF exist lines.txt (del lines.txt)

:stage1
if "%1"=="" goto :eof
set command=
FOR /F usebackq %%F IN (`where %1`) DO (
set command=%%F
)

IF defined command (echo %1 is exe >> lines.txt) else (goto stage2)
shift
goto stage1

:stage2
set str=
if "%1"=="" goto :eof
FOR /F usebackq %%F IN (`findstr /b /i /c:"%1  " help.txt`) DO (
set str=%%F
)

IF defined str (ECHO %1 is built in cmd.exe command >> lines.txt) else (goto stage3)
shift
goto stage1

:stage3
echo %1 is argument >> lines.txt
shift
goto stage1