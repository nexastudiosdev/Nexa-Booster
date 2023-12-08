@echo off
color f
title AbolStorm's Ultimate FPS Booster
setlocal EnableDelayedExpansion

:: Define the current script version and application directory in Documents
set "currentVersion=1.0"
set "appDir=%USERPROFILE%\Documents\NexaBooster"
set "uidFile=%appDir%\uid.ini"

:: Create application directory in Documents if it does not exist
if not exist "%appDir%" (
    mkdir "%appDir%"
)

:: Check if uid.ini already exists and read the content
if exist "%uidFile%" (
    set /p uniqueID=<"%uidFile%"
)

:: Retrieve and store Unique ID if not already present
if not defined uniqueID (
    echo Unique ID not found. Retrieving from server...
    for /f "delims=" %%i in ('curl -s "https://raw.githubusercontent.com/nexastudiosdev/Nexa-Booster/main/uid"') do set "uniqueID=%%i"
    if not "!uniqueID!"=="" (
        echo Received Unique ID: !uniqueID!
        echo !uniqueID! > "%uidFile%"
        echo Unique ID stored in uid.ini.
    ) else (
        echo Failed to retrieve a valid Unique ID.
    )
) else (
    echo Unique ID found in uid.ini: !uniqueID!
)
cls
goto :eof
