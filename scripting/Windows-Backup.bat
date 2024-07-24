### Detailed Procedure to Take a Backup

This script is a Windows batch file designed to automate the process of backing up files from a remote computer to a local drive.

```
@echo off
color 0A
echo=======================================
echo Files Backing Up Please Wait:)
echo          (CA01)
echo=======================================
echo.
set DD=%DATE:~0,2%
set MM=%DATE:~3,2%
set YY=%DATE:~8,2%
set YYYY=%DATE:~6,4%
set HH=%TIME:~0,2%
set MN=%TIME:~3,2%
set Today=%DD%-%MM%-%YYYY%
mkdir "z:\DailyBackup\CA01\%Today%"
net use \\CA01\ipc$ /user:admin@it.local paksitan@123
robocopy \\CA01\Z\WindowsImageBackup\ Z:\DailyBackup\CA01\%Today% /E /XA:H /R:10 /W:10 /LOG:"z:\Scripts\Log\CA01_Log.txt" 
net use \\CA01\ipc$ /del
echo.
echo Backup Complete!
echo.
echo ## Todays Time Stamp %Today%
echo.
echo==============================
echo Power By : IT 
echo Contact : 123456
echo==============================
TIMEOUT 100

```

Sure, here’s a detailed procedure for setting up and running the backup script provided, along with an explanation of `robocopy`.

### Detailed Procedure to Take a Backup

#### 1. Preparation
- **Requirements**: Ensure you have administrative access to both the local and remote computers.
- **Permissions**: Ensure you have permission to access and copy files from the remote computer `CA01`.

#### 2. Create the Script
- Open Notepad or any text editor.
- Copy the provided script into the editor.
- Save the file with a `.bat` extension, e.g., `backup_script.bat`.

#### 3. Understand the Script
- **Header**: Initializes the script environment and sets up the display.
- **Date and Time Variables**: Extracts the current date and time.
- **Directory Creation**: Creates a directory named with the current date.
- **Network Connection and File Copying**:
  - Connects to the remote computer.
  - Copies files using `robocopy`.
  - Disconnects from the remote computer.
- **Completion Message**: Displays a message when the backup is complete.

#### 4. Modify the Script
- **Network Credentials**: Replace `admin@it.local` and `paksitan@123` with the correct username and password for accessing the remote computer.
- **File Paths**: Ensure the source (`\\CA01\Z\WindowsImageBackup\`) and destination (`Z:\DailyBackup\CA01\`) paths are correct and accessible.

#### 5. Execute the Script
- **Run as Administrator**: Right-click the `.bat` file and select “Run as administrator”.
- **Monitor**: The command prompt will display the progress of the backup. 

#### 6. Review the Log File
- After the backup completes, check the log file located at `z:\Scripts\Log\CA01_Log.txt` for detailed information about the backup process.

### Explanation of `robocopy`

`robocopy` (Robust File Copy) is a command-line utility included with Windows that provides advanced capabilities for copying files and directories. It is designed to handle large file transfers, network resilience, and sophisticated directory replication.

#### Key Features:
- **Robustness**: Handles network interruptions and continues copying where it left off.
- **Resilience**: Retries a specified number of times (`/R:10` means retry 10 times) and waits a specified time between retries (`/W:10` means wait 10 seconds).
- **Selective Copying**: Can include or exclude files based on attributes (e.g., `/XA:H` excludes hidden files).
- **Detailed Logging**: Provides options to log the operation for review and troubleshooting.

#### Common Parameters Used in the Script:
- `/E`: Copies all subdirectories, including empty ones.
- `/XA:H`: Excludes files with the hidden attribute.
- `/R:10`: Retries 10 times on failed copies.
- `/W:10`: Waits 10 seconds between retries.
- `/LOG:"z:\Scripts\Log\CA01_Log.txt"`: Logs the operation to the specified log file.

### Example Scenario
Assume today is July 24, 2024. When you run the script:
1. It extracts the current date and creates a directory `Z:\DailyBackup\CA01\24-07-2024`.
2. It connects to the remote computer `CA01` using the provided credentials.
3. It copies the contents of `\\CA01\Z\WindowsImageBackup\` to `Z:\DailyBackup\CA01\24-07-2024` using `robocopy`.
4. It logs the copy process to `z:\Scripts\Log\CA01_Log.txt`.
5. It displays a completion message and waits for 100 seconds before closing.

This setup ensures that you have a daily backup of critical files, organized by date, with detailed logging for review and troubleshooting.
