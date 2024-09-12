# File Server Resource Manager (FSRM)

**File Server Resource Manager (FSRM)** is a feature in Windows Server that allows administrators to manage and control the amount and type of data stored on file servers. It provides a set of tools to configure quotas, file screens, storage reports, and classify files, enabling better storage utilization and data management.

#### **Key Features of FSRM**:

1. **Quota Management**:
   - Allows administrators to set limits on the amount of disk space that can be used by a folder or volume.
   - Two types of quotas:
     - **Hard Quota**: Strictly enforces the limit, preventing users from saving additional data once the quota is reached.
     - **Soft Quota**: Warns users when they approach the limit but doesn't stop them from storing more data.

2. **File Screening**:
   - Helps block certain types of files from being saved on a server (e.g., media files, executables).
   - File screens can be configured to:
     - **Block specific file types**.
     - **Send notifications** to administrators or users when attempts to save disallowed file types are made.

3. **Storage Reports**:
   - Provides detailed reports on storage usage, allowing administrators to monitor how storage is being utilized and by whom.
   - Common reports include:
     - **Duplicate files**: Identifies files that take up unnecessary space.
     - **Large files**: Helps locate large files that consume significant storage space.
     - **Least recently accessed files**: Identifies old files that can potentially be archived or deleted.
     - **Quota usage**: Shows how much space users are consuming in relation to their set quotas.

4. **File Classification**:
   - Enables classification of files based on predefined properties or custom properties.
   - Administrators can classify data automatically to apply policies such as archiving or encrypting based on file types or other criteria.

5. **Automated File Management Tasks**:
   - **FSRM** can automate tasks like moving or archiving files based on file classification or storage policies. For instance, files that haven't been accessed in a long time can be automatically moved to cheaper storage.

#### **Benefits of FSRM**:
- **Improved Storage Management**: Helps optimize storage by ensuring users don’t overuse server resources or store inappropriate files.
- **Data Compliance**: Helps maintain regulatory compliance by enforcing policies on file storage and retention.
- **Enhanced Security**: By screening files, it helps prevent users from saving malicious or unauthorized file types.
- **Storage Reporting**: Detailed reports allow administrators to keep track of file server usage patterns, helping with storage planning and cleanup activities.

**FSRM** is a valuable tool for ensuring efficient and secure file storage management on Windows servers.

----

# **Installation of FSRM**:

To install **File Server Resource Manager (FSRM)** on a Windows Server, follow these steps:

### **Steps to Install FSRM via Server Manager:**

1. **Open Server Manager:**
   - On your Windows Server, click on the **Start Menu** and search for **Server Manager**. Open it.

2. **Add Roles and Features:**
   - In the **Server Manager** dashboard, click on **Add roles and features** from the right-hand menu.

3. **Before You Begin:**
   - In the **Add Roles and Features Wizard**, click **Next** on the **Before You Begin** page.

4. **Select Installation Type:**
   - On the **Installation Type** page, select **Role-based or feature-based installation**, then click **Next**.

5. **Select Destination Server:**
   - Choose the server on which you want to install FSRM. If it’s the local server, it will be selected by default. Click **Next**.

6. **Select Server Roles:**
   - In the **Server Roles** list, expand **File and Storage Services**.
   - Then expand **File and iSCSI Services**.
   - Check the box for **File Server Resource Manager**.

7. **Add Required Features:**
   - If prompted, click **Add Features** to include any additional components required by FSRM.

8. **Select Features (Optional):**
   - You can select any additional features if needed, or simply click **Next** to skip this section.

9. **Confirm Installation Selections:**
   - Review the roles and features you’ve selected. If everything looks correct, click **Install**.

10. **Installation Progress:**
    - The installation will begin. You can monitor the progress from the window. Once the installation completes, you’ll see a confirmation message.

11. **Close the Wizard:**
    - Once installed, click **Close** to exit the installation wizard.

### **Steps to Open FSRM after Installation:**

1. **Open FSRM:**
   - After installation, go to **Server Manager**.
   - Under **Tools**, select **File Server Resource Manager** to launch the FSRM management console.

2. **Configure FSRM:**
   - From here, you can start configuring quotas, file screens, and reports for managing your file server.

### **Installing FSRM Using PowerShell:**

Alternatively, you can install FSRM using PowerShell:

1. Open **PowerShell** as an administrator.
2. Run the following command:

   ```powershell
   Install-WindowsFeature -Name FS-Resource-Manager -IncludeManagementTools
   ```

3. Once the installation is complete, you will see a confirmation message. You can now manage FSRM through the **Server Manager** or PowerShell.

This is how you can install **File Server Resource Manager (FSRM)** on a Windows Server to start managing and controlling file storage effectively.

----

# Quota Management

**Quota Management** in **File Server Resource Manager (FSRM)** allows you to manage disk space usage by setting limits on the amount of data that can be stored in specific folders or volumes. This helps to prevent overuse of storage resources and ensures that users don't exceed their allotted space.

### Steps to Configure Quota Management:

#### **1. Open File Server Resource Manager (FSRM)**:
   - Open **Server Manager** on your Windows Server.
   - Click on **Tools** in the top-right corner.
   - Select **File Server Resource Manager** from the drop-down menu.

#### **2. Create a New Quota**:

   **a. Open the Quota Management Section**:
   - In the **FSRM** console, expand **Quota Management** on the left-hand pane.
   - Right-click **Quotas**, and then select **Create Quota**.

   **b. Define the Path**:
   - In the **Create Quota** dialog box, under **Quota Path**, enter the folder or volume for which you want to apply the quota. Alternatively, click **Browse** to navigate to the folder.

   **c. Choose Quota Type**:
   - **Auto Apply Template and Create Quotas on Existing and New Subfolders**: Automatically applies the quota to new subfolders as they are created.
   - **Create Quota on Path**: Applies the quota directly to the selected folder.

#### **3. Configure Quota Settings**:

   **a. Select a Quota Template**:
   - From the **Create Quota** window, select a **quota template** or click **Create Custom Quota Properties** to define custom settings.
   - Common templates include:
     - **200 MB Limit**: Set a hard limit of 200 MB on folder storage.
     - **5 GB Soft Quota**: Warns users when they approach 5 GB, but does not stop them from storing more data.

   **b. Create Custom Quota (Optional)**:
   - If you want to create a custom quota, click **Define custom quota properties**.
   - Choose between:
     - **Hard Quota**: Enforces the limit strictly, preventing additional data once the quota is reached.
     - **Soft Quota**: Notifies users when the limit is reached but allows more data to be stored.

#### **4. Configure Notification Thresholds (Optional)**:
   - If you want to notify users or administrators when the quota limit is approaching or reached:
     - Select **Add** in the **Notification Thresholds** section to set up email alerts, event logs, or commands that trigger at certain storage thresholds (e.g., 85% usage).

#### **5. Apply the Quota**:
   - Once all the settings are configured, click **Create** to apply the quota.

### **Managing Quotas**:

Once a quota is created, it will appear under the **Quotas** section in **FSRM**. You can manage, modify, or delete existing quotas by right-clicking on them and selecting the appropriate action.

### **Quota Templates**:

You can create and apply quota templates to standardize how quotas are implemented across multiple folders. Templates are reusable and simplify the quota management process.

#### **Steps to Create a Quota Template**:
   1. In the **File Server Resource Manager**, under **Quota Management**, right-click **Quota Templates** and select **Create Quota Template**.
   2. Configure the space limit, threshold notifications, and other settings.
   3. Save the template for future use.


### **Using PowerShell to Manage Quotas**:

You can also manage quotas using PowerShell commands. Here’s an example of how to create a quota using PowerShell:

```powershell
New-FsrmQuota -Path "C:\Data" -Template "200 MB Limit"
```

This command applies a quota using the "200 MB Limit" template to the folder `C:\Data`.

**Quota Management** is a powerful tool to ensure that storage resources are used efficiently on file servers. Through quotas, administrators can prevent disk space overuse, control file storage, and maintain performance across the network.

----

# File Screening

**File Screening** is a feature of **File Server Resource Manager (FSRM)** that allows administrators to control the types of files users can save on a file server. By setting up file screens, you can block specific file types (e.g., media files, executables) from being stored in designated folders, helping to enforce organizational policies or conserve disk space.

### Steps to Configure File Screening:

#### **1. Open File Server Resource Manager (FSRM)**:
   - Open **Server Manager** on your Windows Server.
   - Go to **Tools** in the top-right corner, and select **File Server Resource Manager**.

#### **2. Access the File Screening Management**:
   - In the **FSRM** console, expand **File Screening Management** in the left pane.
   - Right-click **File Screens** and select **Create File Screen**.

#### **3. Configure File Screen Settings**:

   **a. Select the Folder**:
   - In the **Create File Screen** dialog box, specify the folder path where you want to apply the file screening rule. This can be a folder or a volume. You can type the path or click **Browse** to navigate to the desired location.

   **b. Choose a File Screen Template**:
   - You can either choose from existing templates or create a custom screen.
   - Common templates include:
     - **Block Audio and Video Files**: Prevents users from saving common audio and video file formats (e.g., MP3, MP4).
     - **Block Executable Files**: Blocks users from saving executable files (e.g., `.exe`, `.bat`).

   **c. Create Custom File Screen (Optional)**:
   - If no existing template fits your needs, select **Define custom file screen properties** to create a custom screen.
   - Choose between:
     - **Active Screening**: Blocks users from saving restricted files. They will receive an error message if they try to save such files.
     - **Passive Screening**: Allows users to save restricted files but logs the activity or sends notifications without blocking the file.

#### **4. Configure File Groups** (Optional):
   - File groups determine which file types to include in the screening rule.
   - You can create custom file groups by selecting **File Groups** under **File Screening Management** in FSRM.
   - For example, you can create a file group for **Image Files** (`.jpg`, `.png`, etc.) or **Compressed Files** (`.zip`, `.rar`).
   - To add or modify file groups, right-click **File Groups** and select **Create File Group** or **Edit File Group**.

#### **5. Set Notifications (Optional)**:
   - You can configure **email notifications**, **event logging**, or **command execution** when a user attempts to save a blocked file type.
   - To do this:
     - In the **Create File Screen** window, click **Create** under the **Notification** section.
     - Set up the type of notification (email, event log, or running a script) that will trigger when the user violates the screening rule.

#### **6. Apply the File Screen**:
   - Once your file screen properties are configured, click **Create** to apply the file screen.

### **Managing File Screens**:

You can view, modify, or delete existing file screens by going to the **File Screens** section under **File Screening Management**. Right-click any file screen to make changes or remove it.


### **File Screen Templates**:

**File Screen Templates** allow you to standardize file screening across multiple folders or volumes. By creating templates, you can quickly apply file screening policies to new locations without reconfiguring everything.

#### **Steps to Create a File Screen Template**:
   1. In **FSRM**, expand **File Screening Management** and select **File Screen Templates**.
   2. Right-click and select **Create File Screen Template**.
   3. Configure the file screen settings, file groups, and notifications.
   4. Save the template for future use.


### **Using PowerShell for File Screening**:

You can also manage file screens via PowerShell. For example, to create a file screen that blocks executable files:

```powershell
New-FsrmFileScreen -Path "C:\Data" -Template "Block Executable Files"
```

This applies the **Block Executable Files** template to the folder `C:\Data`.


### **Benefits of File Screening**:

- **Enforce Corporate Policies**: Prevent users from saving prohibited file types like media, executables, or unauthorized applications.
- **Optimize Disk Space Usage**: Block large file types (e.g., videos, images) from consuming valuable server storage.
- **Improve Security**: Prevent users from inadvertently saving malware or suspicious executables on the server.

File Screening is an essential tool to enforce file storage policies on your network, helping to maintain compliance and better manage server resources.

---
