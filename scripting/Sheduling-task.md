To run the backup script automatically, you can use the Windows Task Scheduler. This utility allows you to schedule tasks to run at specific times or in response to specific events.

### Steps to Schedule the Backup Script Using Task Scheduler

#### 1. Open Task Scheduler
- Press `Win + R` to open the Run dialog.
- Type `taskschd.msc` and press Enter to open the Task Scheduler.

#### 2. Create a New Task
- In the Task Scheduler window, click on **"Create Basic Task..."** from the Actions pane on the right.

#### 3. Name the Task
- In the Create Basic Task Wizard, provide a name (e.g., "Daily Backup") and an optional description for the task.
- Click **Next**.

#### 4. Set the Trigger
- Choose how often you want the script to run. For daily backups, select **Daily**.
- Click **Next** and set the start date and time for the task.
- Click **Next** again.

#### 5. Set the Action
- Choose **"Start a program"** as the action to perform.
- Click **Next**.

#### 6. Select the Script to Run
- Click **Browse** and navigate to the location of your backup script (`backup_script.bat`).
- Select the script and click **Open**.
- Click **Next**.

#### 7. Finish the Task Creation
- Review the summary of your task.
- Check the option **"Open the Properties dialog for this task when I click Finish"** if you want to configure additional settings.
- Click **Finish**.

#### 8. Configure Additional Settings (Optional)
- In the task's properties dialog, you can configure additional settings:
  - **Run with highest privileges**: Check this box if the script requires administrative privileges.
  - **Configure for**: Choose the appropriate Windows operating system.
  - **Triggers**: Add or modify triggers if you want the task to run more frequently or under different conditions.
  - **Conditions**: Set conditions such as starting the task only if the computer is idle.
  - **Settings**: Configure additional settings like allowing the task to be run on demand or restarting if it fails.

#### 9. Save and Close
- After configuring the additional settings, click **OK** to save and close the properties dialog.

### Example: Detailed Task Creation Steps

1. **Open Task Scheduler**:
   - Press `Win + R`, type `taskschd.msc`, and press Enter.

2. **Create a New Basic Task**:
   - Click on **"Create Basic Task..."**.

3. **Name the Task**:
   - Name: `Daily Backup`
   - Description: `Automated daily backup of files from remote computer CA01`
   - Click **Next**.

4. **Set the Trigger**:
   - Select **Daily**.
   - Start date: `07/24/2024`
   - Start time: `02:00 AM` (set the time you want the backup to run).
   - Click **Next**.

5. **Set the Action**:
   - Select **"Start a program"**.
   - Click **Next**.

6. **Select the Script**:
   - Click **Browse**.
   - Select `backup_script.bat`.
   - Click **Next**.

7. **Finish the Task**:
   - Check **"Open the Properties dialog for this task when I click Finish"**.
   - Click **Finish**.

8. **Configure Additional Settings** (if needed):
   - In the properties dialog, check **"Run with highest privileges"**.
   - Configure additional settings as required (triggers, conditions, settings).
   - Click **OK**.

### Testing the Task

1. **Manually Run the Task**:
   - In Task Scheduler, locate your task under **Task Scheduler Library**.
   - Right-click on the task and select **Run** to test if it executes correctly.

2. **Check the Results**:
   - Verify that the backup directory is created and files are copied as expected.
   - Check the log file (`z:\Scripts\Log\CA01_Log.txt`) for any errors or confirmation of successful execution.

By scheduling the task using Task Scheduler, the backup script will run automatically at the specified times, ensuring regular backups without manual intervention.
