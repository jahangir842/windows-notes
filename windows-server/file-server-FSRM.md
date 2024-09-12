### **File Server Resource Manager (FSRM)**

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

## **Installation of FSRM**:

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

---

### **Quota Templates**:

You can create and apply quota templates to standardize how quotas are implemented across multiple folders. Templates are reusable and simplify the quota management process.

#### **Steps to Create a Quota Template**:
   1. In the **File Server Resource Manager**, under **Quota Management**, right-click **Quota Templates** and select **Create Quota Template**.
   2. Configure the space limit, threshold notifications, and other settings.
   3. Save the template for future use.

---

### **Using PowerShell to Manage Quotas**:

You can also manage quotas using PowerShell commands. Here’s an example of how to create a quota using PowerShell:

```powershell
New-FsrmQuota -Path "C:\Data" -Template "200 MB Limit"
```

This command applies a quota using the "200 MB Limit" template to the folder `C:\Data`.

---

**Quota Management** is a powerful tool to ensure that storage resources are used efficiently on file servers. Through quotas, administrators can prevent disk space overuse, control file storage, and maintain performance across the network.

----


