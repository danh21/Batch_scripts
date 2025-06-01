@echo off
setlocal enabledelayedexpansion

REM Traverse folders from deepest to shallowest
for /f "delims=" %%F in ('dir /ad /s /b ^| sort /R') do (
    set "fullpath=%%F"
    set "newpath=!fullpath: =_!"

    if not "!fullpath!"=="!newpath!" (
        echo Renaming:
        echo   From: !fullpath!
        echo   To  : !newpath!

        REM Extract folder name and parent path
        for %%A in ("%%F") do (
            set "foldername=%%~nxA"
            set "parent=%%~dpA"
        )

        REM Uses pushd/popd so ren only uses the folder name, not full path.
        pushd "!parent!" >nul
        ren "!foldername!" "!foldername: =_!"
        popd >nul
    )
)

echo Done.
pause
