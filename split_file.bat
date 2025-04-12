@echo off
setlocal enabledelayedexpansion

:: Limit size for filtering (MB)
set /A SIZE_LIMIT_MB=50
set /A SIZE_LIMIT_BYTES=%SIZE_LIMIT_MB% * 1024 * 1024
 
:: Size for RAR files
set "RAR_SPLIT_SIZE=45"

:: Path to WinRAR
set WINRAR="C:\Program Files\WinRAR\WinRAR.exe"

echo Looking for files larger than %SIZE_LIMIT_MB%MB...
for /r %%F in (*) do (
    set "file=%%~fF"
    set "filename=%%~nxF"
    set "filepath=%%~dpF"
    set "basename=%%~nF"

    set "filesize=%%~zF"
    if !filesize! GTR %SIZE_LIMIT_BYTES% (
        echo Large File: !file! [!filesize! bytes]

        set "rar_output=!filepath!!basename!.rar"

        echo Compressing into %RAR_SPLIT_SIZE%MB compressed files...
        %WINRAR% a -m5 -v%RAR_SPLIT_SIZE%m -ep1 "!rar_output!" "%%F"

        if errorlevel 1 (
            echo Error: %%F
        ) else (
            echo Compressed: !rar_output!
        )
    )
)

echo Process completed !
pause
