@echo off
setlocal enabledelayedexpansion

set "suffix=test"
set "this_script=%~nx0"

for %%f in (*) do (
    if /I not "%%~nxf"=="%this_script%" (
        ren "%%f" "%%~nf%suffix%%%~xf"
    )
)

echo All files renamed with suffix [%suffix%]
pause