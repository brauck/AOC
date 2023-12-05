@echo off

call :init
tree p4_tests /f
call p4.bat p4_tests\file1.txt p4_tests\folder1 p4_tests\file2.zip p4_tests\folder2 p4_tests\file3.doc p4_tests\folder3
tree p4_tests /f
rd /s /q p4_tests

call :init
call p4.bat p4_tests\file1.tx p4_tests\folder1 p4_tests\file2.zip p4_tests\folder p4_tests\file3.doc p4_tests\folder2 p4_tests\file2.zip
tree p4_tests /f

rd /s /q p4_tests
exit /b %errorlevel%

:init
md p4_tests
md p4_tests\folder1
md p4_tests\folder2
md p4_tests\folder3

echo > p4_tests\file1.txt
echo > p4_tests\file2.zip
echo > p4_tests\file3.doc
exit /b 0