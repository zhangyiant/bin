@echo off
setlocal

rem Override these environment variables to reuse the script on another machine
rem without editing the tracked file.
if not defined BACKUP_SOURCE_DOCUMENTS set "BACKUP_SOURCE_DOCUMENTS=C:\Users\zhang\Documents\MyDocuments"
if not defined BACKUP_SOURCE_PICTURES set "BACKUP_SOURCE_PICTURES=C:\Users\zhang\Pictures\Pictures"
if not defined BACKUP_SOURCE_VIDEOS set "BACKUP_SOURCE_VIDEOS=C:\Users\zhang\Videos\Videos"
if not defined BACKUP_DEST_ROOT set "BACKUP_DEST_ROOT=\\192.168.1.238\nas"

call :run_backup "%BACKUP_SOURCE_DOCUMENTS%" "%BACKUP_DEST_ROOT%\Documents" "Documents"
if errorlevel 1 exit /b %ERRORLEVEL%

call :run_backup "%BACKUP_SOURCE_PICTURES%" "%BACKUP_DEST_ROOT%\Pictures" "Pictures"
if errorlevel 1 exit /b %ERRORLEVEL%

call :run_backup "%BACKUP_SOURCE_VIDEOS%" "%BACKUP_DEST_ROOT%\Videos" "Videos"
if errorlevel 1 exit /b %ERRORLEVEL%

echo Backup completed successfully.
exit /b 0

:run_backup
echo Backing up %~3...
robocopy "%~1" "%~2" /e
set "ROBOCOPY_EXIT=%ERRORLEVEL%"

if %ROBOCOPY_EXIT% GEQ 8 (
    echo Backup failed for %~3.
    exit /b %ROBOCOPY_EXIT%
)

exit /b 0
