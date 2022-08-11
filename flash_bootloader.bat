@echo off
REM : Copyright (C) 2022 Avnet
REM : This BAT script used to call TTL(Tera Term Language) script to program bootloader image.

set WORK_DIR=%~dp0
set TOOLS_PATH=%WORK_DIR%tools

REM : Parser configure file
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
  if %%a==COM                 set COM=%%b
  if %%a==FLASH_WRITER        set FLASH_WRITER=%%b
  if %%a==FILE_BL2            set FILE_BL2=%%b
  if %%a==FILE_FIP            set FILE_FIP=%%b
)

REM : Choose program media
echo.
echo [1]: eMMC
echo [2]: QSPI
echo.
set /p choice= Please Input Your Choice: 
echo.

if %choice% equ 1 (
   set MEDIA=0
) else (
   set MEDIA=1
)

REM : Lauch Tera Term Macro script to start program
set ARGS=%COM% %MEDIA% %WORK_DIR% %FLASH_WRITER% %FILE_BL2% %FILE_FIP%
start %TOOLS_PATH%\ttpmacro.exe /I %TOOLS_PATH%\flash_bootloader.ttl %ARGS%