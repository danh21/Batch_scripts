@echo off
:Test_OK
ECHO Press keyboard
CALL focus.bat "" "{PRTSC}"
PING -n 1 0.0.0.0 >NUL
Echo Release keyboard
CALL focus.bat "" "{PRTSC}"
PING -n 180 0.0.0.0 >NUL
GOTO Test_OK