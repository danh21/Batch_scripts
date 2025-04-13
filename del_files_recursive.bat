@echo off
setlocal enabledelayedexpansion

set "this_script=%~nx0"

:: Delete all files in the sub-folder (including the current folder)
for /r %%f in (*) do (
    if /I not "%%~nxf"=="%this_script%" (
        del "%%f"
    )
)

echo Deleted all.
pause
