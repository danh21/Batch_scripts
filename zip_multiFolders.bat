@REM path to your file .exe
set app="C:\Program Files\WinRAR\Rar.exe"

for /d %%X in (*) do %app% a -r "%%X.zip" "%%X\"