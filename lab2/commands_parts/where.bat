@ECHO off
IF exist lines.txt (del lines.txt)

:loop
set command=
if "%1"=="" goto :eof
FOR /F usebackq %%F IN (`where %1`) DO (
set command=%%F
)
::echo %command% >> lines.txt

IF defined command (echo %command% >> lines.txt) else (goto arg)
shift
goto loop

:arg

echo %1 is argument
shift
goto loop