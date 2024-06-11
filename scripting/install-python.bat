@echo off
SETLOCAL

REM === Set variables ===
set PYTHON_HOME=%ProgramFiles%\Python312

set SOFTWARES="C:\Softwares"
set PATH=%PYTHON_HOME%;%PATH%
set PYTHON_VERSION="3.12.4"

REM === Install Python ===
echo Installing Python...
%SOFTWARES%\python-%PYTHON_VERSION%-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

echo Python Installed

REM === Verify Installation ===
echo Verifying installations...
python --version

echo Python installation completed.

ENDLOCAL
pause


