REM : Copyright (C) 2022 Avnet
REM : This BAT script should be called by TTL macro, but not run it directly.

@echo off

REM : Parser command arugments
set BOARD_IP=%1
set WORK_DIR=%2
set IMG_NAME=%3

REM : fastboot commnad is in tools folder
set PATH=%PATH%;%WORK_DIR%\tools

REM : Fastboot command prefix, add -v to enable verbose mode
set FB=fastboot -s udp:%BOARD_IP% -v

cd %WORK_DIR%

REM : get u-boot and fastboot version
%FB% getvar version-bootloader
%FB% getvar version

REM start flash RAW system image
echo %FB% flash rawimg %IMG_NAME%
%FB% flash rawimg %IMG_NAME%

echo,
pause
