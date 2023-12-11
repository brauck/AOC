@echo off
set /a count=0

:loop
set /a count+=1
if [%1]==[] goto end
echo %1 %count% >> words.txt
shift
goto loop

:end
sort words.txt > sorted_words.txt
for /f "tokens=1,2" %%i in (sorted_words.txt) do @echo %%j %%i
del words.txt sorted_words.txt