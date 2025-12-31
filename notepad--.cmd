@echo off
for /f %%a in ('echo prompt $H ^| cmd') do set "BS=%%a"
title padnote--
setlocal enabledelayedexpansion
set /p a=What is your file name(and its extension) : 
set aa=1
type nul > %a%
goto bb

:bb
echo /----------------------------\
echo ^| My other project : run.cmd ^|
echo ^|   Available on my github^^!  ^|
echo ^|      Do you want it^?       ^|
echo \----------------------------/
choice /C YNE
if errorlevel 3 exit
if errorlevel 2 goto bbb
if errorlevel 1 goto bbbb

:b
set /p aaa=Line %aa% : 
echo %aaa% >> %a%
set /a aa=%aa%+1
set /a aaaa=%aa%
<nul set /p "=saving(idk if it's saving or not)...  "
for /L %%i in (1,1,%aaaa%) do (
    for %%A in (^| / - \) do (
        <nul set /p "=!BS!%%A"
        ping 127.0.0.1 -n 1 -w 10 >nul
    )
)
echo.
goto b

:bbb
choice /m "Do you want to use it?"
if errorlevel 2 goto b
if errorlevel 1 goto bbbb

:bbbb
curl https://raw.githubusercontent.com/ARandomAxolotl/batch-runner-idk/refs/heads/main/run.cmd --output run.cmd
goto b