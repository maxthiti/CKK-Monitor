@echo off
setlocal

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

if exist "%STARTUP%\start-rpg15.vbs" (
  del /f /q "%STARTUP%\start-rpg15.vbs"
  echo Removed: %STARTUP%\start-rpg15.vbs
) else (
  echo Not found: start-rpg15.vbs ^(already uninstalled^)
)

if exist "%STARTUP%\start-rpg15.bat" (
  del /f /q "%STARTUP%\start-rpg15.bat"
  echo Removed: %STARTUP%\start-rpg15.bat
)

echo RPG15 auto-start has been removed.
pause

endlocal
