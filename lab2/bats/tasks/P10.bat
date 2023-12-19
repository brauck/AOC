@chcp 65001
@echo off

if [%1]==[] goto end

for %%f in (%1\*.txt %1\*.htm %1\*.bat) do (
  echo "%%f"
  type "%%f"
  echo[
  echo[
)

goto :eof
:end
echo Нужно ввести адрес директории