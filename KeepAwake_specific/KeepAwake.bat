@echo off

set targetTime=17:45

@REM -------------------------------- get day in week --------------------------------

for /f "tokens=2 delims==" %%i in ('wmic path win32_localtime get dayofweek /value') do set day=%%i
if %day%==0 set weekday=Sunday
if %day%==1 set weekday=Monday
if %day%==2 set weekday=Tuesday
if %day%==3 set weekday=Wednesday
if %day%==4 set weekday=Thursday
if %day%==5 set weekday=Friday
if %day%==6 set weekday=Saturday

if %weekday%==Saturday goto :CLOSE
if %weekday%==Sunday goto :CLOSE

@REM -------------------------------- press release key --------------------------------
:Test_OK
ECHO Press keyboard
CALL focus.bat "" "{PRTSC}"
PING -n 1 0.0.0.0 >NUL
Echo Release keyboard
CALL focus.bat "" "{PRTSC}"
PING -n 180 0.0.0.0 >NUL

@REM ------------------------ compare time to close ------------------------
rem Get the current time
set currentTime=%time:~0,5%

rem Remove leading zeros from hours
for /f "tokens=* delims=0" %%i in ("%currentTime:~0,2%") do set currentHour=%%i

rem Extract minutes
set currentMinute=%currentTime:~3,2%

rem Combine hours and minutes
set currentTime=%currentHour%:%currentMinute%

rem Compare times
if "%currentTime%" geq "%targetTime%" (
    echo The current time is after or equal to %targetTime%.
    goto :CLOSE
)

goto :Test_OK



@REM -------------------------------- the end --------------------------------
:CLOSE
exit 0