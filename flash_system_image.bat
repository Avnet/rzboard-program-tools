@echo off
REM : Copyright (C) 2022 Avnet
REM : This BAT script used to call TTL(Tera Term Language) script to program system image.

set WORK_DIR=%~dp0
set TOOLS_PATH=%WORK_DIR%tools

REM : Parser configure file
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
if %%a==COM           set COM=%%b
if %%a==IPADDR        set IPADDR=%%b
if %%a==FILE_SYSIMG   set FILE_SYSIMG=%%b
)

REM : Select a connection method
echo.
echo [1]: via Ethernet
echo [2]: via USB
echo.
set /p choice= Please select connection method: 
echo.

if %choice% equ 1 (
   set CONN_MODE=0
) else (
   set CONN_MODE=1
)

REM : Lauch Tera Term Macro script to start program
set ARGS=%COM% %IPADDR% %WORK_DIR% %FILE_SYSIMG% %CONN_MODE%
start %TOOLS_PATH%\ttpmacro.exe /I %TOOLS_PATH%\flash_system_image.ttl %ARGS%