@echo off
SETLOCAL

REM === Set variables ===
setx JAVA_HOME "C:\Java\jdk"
setx SOFTWARES "C:\Softwares"
setx PATH "%PATH%;C:\Java\jdk\bin"

setx PATH "%PATH%;C:\spark\bin"

set PYTHON_HOME=%ProgramFiles%\Python312
set SOFTWARES="C:\Softwares"
set PATH=%PYTHON_HOME%;%PATH%
set PYTHON_VERSION="3.12.4"


REM === Create installation directory if it doesn't exist ===
if not exist "%JAVA_HOME%" (
    mkdir "%JAVA_HOME%"
    echo Created directory: %JAVA_HOME%
)


REM === Install Java JDK ===
echo Installing Java JDK...
%SOFTWARES%\jdk.exe /s ADDLOCAL="ToolsFeature" INSTALLDIR="%JAVA_HOME%"

echo Installing Python...
%SOFTWARES%\python.exe /quiet InstallAllUsers=1 PrependPath=1

echo Java JDK Installed
echo Python Installed

REM === Verify Installation ===
echo Verifying installations...
java -version
python --version

echo JDK installation completed.
echo Python installation completed.

ENDLOCAL
pause


