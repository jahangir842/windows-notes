# Windows Server Update Services (WSUS)

**Windows Server Update Services (WSUS)** allows administrators to manage and deploy updates for Microsoft products in a corporate environment. Here’s a guide on how to install and manage a WSUS server on Windows Server:

---

## Install WSUS Server

#### **a. Install WSUS via Server Manager**

1. **Open Server Manager**:
   - Click **Start**, then **Server Manager**.

2. **Add Roles and Features**:
   - In **Server Manager**, click **Manage** > **Add Roles and Features**.

3. **Role-Based Installation**:
   - Click **Next** until you reach the **Server Roles** page.
   - Select **Windows Server Update Services**.
   - Click **Next** to proceed through the prompts.

4. **Add Features**:
   - On the **Select features** page, additional features required for WSUS will be added automatically.
   - Click **Next**.

5. **Role Services**:
   - On the **Select role services** page, ensure **WSUS Services** is selected.
   - You may also need to select **Database** options depending on your configuration (WID or SQL Server).

6. **Choose Installation Location**:
   - Specify the location where WSUS will store updates (default is usually fine).
   - Click **Next**.

7. **Confirmation and Installation**:
   - Review your selections and click **Install**.
   - Once the installation completes, click **Close**.

---

## Post-Installation Configuration

1. **Open WSUS Configuration Wizard**:
   - After installation, the WSUS Configuration Wizard should automatically start. If not, you can manually start it from **Server Manager** > **Tools** > **Windows Server Update Services**.

2. **Configure WSUS**:
   - Follow the wizard to configure the WSUS server. This includes:
     - **Choosing the Update Source**: Select whether WSUS will synchronize updates from Microsoft Update or another WSUS server.
     - **Specify Proxy Server**: If your network uses a proxy, configure the proxy settings.
     - **Choose Upstream Server**: If syncing from another WSUS server, enter its details.
     - **Configure Synchronization Schedule**: Set how often WSUS will check for updates.
     - **Select Products and Classifications**: Choose which products (Windows versions, Office, etc.) and classifications (critical updates, security updates, etc.) you want to receive.

3. **Finish Configuration**:
   - Complete the wizard and click **Finish**.

---

## Manage WSUS Server

#### **a. WSUS Administration Console**

1. **Open WSUS Console**:
   - In **Server Manager**, go to **Tools** > **Windows Server Update Services**.

2. **Navigate the Console**:
   - **Update Services**: View and manage the updates, including approvals, synchronization status, and server settings.
   - **Computers**: View and manage the computers connected to WSUS.
   - **Reports**: Generate reports on update status, compliance, etc.

#### **b. Configure Update Approval**

1. **Manage Updates**:
   - In the WSUS console, go to **Updates**.
   - Select the update you want to approve or decline.
   - Right-click and choose **Approve** or **Decline**.
   - Select the target groups (e.g., **All Computers**, **Custom Groups**).

2. **Create Computer Groups**:
   - Go to **Computers** > **All Computers**.
   - Create custom computer groups to manage different sets of computers separately.
   - Assign computers to these groups based on their role or department.

#### **c. Synchronize Updates**

1. **Manual Synchronization**:
   - In the WSUS console, go to **Update Services** > **Synchronization**.
   - Click **Synchronize Now** to manually check for and download updates.

2. **Scheduled Synchronization**:
   - Configure the synchronization schedule in the WSUS console under **Options** > **Synchronization Schedule**.
   - Set how often WSUS should sync with Microsoft Update.

#### **d. Monitor WSUS**

1. **View Update Status**:
   - In the WSUS console, go to **Reports** > **Update Status**.
   - Review the update status and compliance of computers.

2. **Check Event Logs**:
   - Use **Event Viewer** to monitor WSUS-related logs for errors and warnings.

---

## Troubleshooting WSUS**

1. **WSUS Logs**:
   - Review WSUS logs located in `C:\Program Files\Update Services\LogFiles` for issues related to update synchronization and server health.

2. **Check Network Connectivity**:
   - Ensure WSUS can connect to Microsoft Update or the upstream WSUS server by checking network settings and firewall rules.

3. **Database Maintenance**:
   - Regularly maintain the WSUS database by running built-in cleanup tasks (e.g., **Server Cleanup Wizard**).

4. **Reindex Database**:
   - If you encounter performance issues, consider reindexing the WSUS database using SQL Server Management Studio or scripts.

By following these steps, you can effectively install, configure, and manage a WSUS server to ensure efficient update deployment and management in your organization.
