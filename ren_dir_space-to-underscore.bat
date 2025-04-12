@echo off
setlocal enabledelayedexpansion

:: Process deepest folders first to avoid path issues
for /f "delims=" %%F in ('dir /ad /b /s ^| sort /R') do (
    set "folder=%%~F"
    set "name=%%~nxF"
    set "parent=%%~dpF"
    set "newname=!name: =_!"
    if not "!name!"=="!newname!" (
        ren "%%F" "!newname!"
    )
)
