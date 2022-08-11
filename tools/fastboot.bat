@echo off
REM : Copyright (C) 2022 Avnet
REM : This BAT script should be called by TTL macro, but not run it directly.

REM : Parser command arugments
set BOARD_IP=%1
set WORK_DIR=%2
set IMG_NAME=%3

REM : Image file full path
set IMG_PATH=%WORK_DIR%images\%IMG_NAME%

REM : Fastboot command prefix, add -v to enable verbose mode
set FB=fastboot -s udp:%BOARD_IP% -v

REM : Change working directory to tools
pushd %WORK_DIR%\tools
echo,

REM : get u-boot and fastboot version
%FB% getvar version-bootloader
%FB% getvar version
echo,

REM : start flash RAW system image
echo %FB% flash rawimg %IMG_PATH%
%FB% flash rawimg %IMG_PATH%
echo,

pause