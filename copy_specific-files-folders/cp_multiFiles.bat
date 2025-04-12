@echo off

@REM Specify path of each file and folder to filelist.txt
set filelist_path=copy_specific-files\filelist.txt

@REM Specify destination path of output
set dest_path=copy_specific-files\output
if not exist "%dest_path%" (
    mkdir "%dest_path%"
)

for /F "tokens=*" %%A in (%filelist_path%) do (
    if exist "%%~A\*" (
        echo Copying folder: %%A
        xcopy "%%~A" "%dest_path%\%%~nxA\" /E /I /Y >nul
    ) else if exist "%%~A" (
        echo Copying file: %%A
        xcopy "%%~A" "%dest_path%\" /Y >nul
    ) else (
        echo Not found: %%A
    )
)

pause
