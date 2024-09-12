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

#### **Accessing FSRM**:
To install **FSRM**:
1. Open **Server Manager** on Windows Server.
2. Select **Add roles and features**.
3. In the **Server Roles** section, expand **File and Storage Services** > **File and iSCSI Services**.
4. Select **File Server Resource Manager**, then follow the installation steps.

After installation, FSRM can be managed using the **File Server Resource Manager MMC Snap-in**. 

**FSRM** is a valuable tool for ensuring efficient and secure file storage management on Windows servers.
