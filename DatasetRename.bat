@ECHO off
cls
cd "%userprofile%\Videos\%DIR%"
ren *.wav %DIR%.wav

setlocal disableDelayedExpansion
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
for /f "eol=: delims=" %%F in ('dir /b /a-d *.wav') do call :renameFile "%%F"
exit /b

:renameFile
setlocal enableDelayedExpansion
:retry
set "name="
for /l %%N in (1 1 8) do (
  set /a I=!random!%%36
  for %%I in (!I!) do set "name=!name!!chars:~%%I,1!"
)
echo if exist !name!.wav goto :retry
endlocal & ren %1 %name%.wav