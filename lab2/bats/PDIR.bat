@chcp 65001
@echo off

dir /q /a %1 > %2
find ".txt" %2 | sort /r > %3