@chcp 65001
@echo off
call P2.bat 
call P2.bat D:\backup_docs2.zip
call p2.bat D:\work D:\test_for_P2
call P2.bat D:\backup_docs.zip D:\test_for_P2
call P2.bat D:\backup_docs2.zip D:\test_fo_P2
call P2.bat D:\backup_docs2.zip D:\test_for_P2
pause

:: Ожидание результата:
:: Нужно ввести два аргумента
:: Нужно ввести два аргумента
:: Файл не найден
:: Файл не найден
:: Папка не найдена
::         1 file(s) copied.