@echo off
SETLOCAL

REM === Set variables ===
setx JAVA_HOME "C:\Java\jdk"
setx SOFTWARES "C:\Softwares"
setx PATH "%PATH%;C:\Java\jdk\bin"

REM === Create installation directory if it doesn't exist ===
if not exist "%JAVA_HOME%" (
    mkdir "%JAVA_HOME%"
    echo Created directory: %JAVA_HOME%
)


REM === Install Java JDK ===
echo Installing Java JDK...

start "" "%SOFTWARES%\jdk.exe" /s ADDLOCAL="ToolsFeature" INSTALLDIR="%JAVA_HOME%"

echo Java JDK Installed

REM === Verify Installation ===
echo Verifying installations...
java -version

echo JDK installation completed.

ENDLOCAL
pause


