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

REM : Lauch Tera Term Macro script to start program
set ARGS=%COM% %IPADDR% %WORK_DIR% %FILE_SYSIMG%
start %TOOLS_PATH%\ttpmacro.exe /I %TOOLS_PATH%\flash_system_image.ttl %ARGS%