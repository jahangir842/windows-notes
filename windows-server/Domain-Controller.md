## Active Directory Domain Services (AD DS)

To install **Active Directory Domain Services (AD DS)** on a Windows Server, follow these steps:

### 1. **Install AD DS Using Server Manager**

1. **Open Server Manager**:
   - Press `Win + R`, type `ServerManager`, and press **Enter**.

2. **Add Roles and Features**:
   - In **Server Manager**, click **Manage** in the top-right corner, and select **Add Roles and Features**.

3. **Select Installation Type**:
   - In the **Add Roles and Features Wizard**, select **Role-based or feature-based installation**, and click **Next**.

4. **Choose the Server**:
   - Select the server on which you want to install AD DS, then click **Next**.

5. **Select Server Roles**:
   - On the **Server Roles** page, check the box for **Active Directory Domain Services**. When prompted to add required features, click **Add Features**, then click **Next**.

6. **Select Features**:
   - On the **Features** page, you can select additional features if needed. Typically, you can just click **Next** without adding anything here.

7. **Review AD DS Information**:
   - Review the information about **AD DS** and click **Next**.

8. **Confirm and Install**:
   - On the **Confirmation** page, review your selections, then click **Install**.

   The installation will begin. Once completed, the next step is to configure your server to become a Domain Controller.

### 2. **Promote the Server to a Domain Controller**

After AD DS is installed, you need to promote the server to a Domain Controller.

1. **Open the AD DS Post-Deployment Configuration**:
   - Once the installation is complete, click the **Promote this server to a domain controller** link in **Server Manager**.

2. **Deployment Configuration**:
   - In the **Deployment Configuration** window, choose one of the following options:
     - **Add a new forest** if this is the first Domain Controller in your environment.
     - **Add a domain controller to an existing domain** if a domain already exists.

   Enter the **Root domain name** (for a new forest) or choose the existing domain (for additional DC), and click **Next**.

3. **Domain Controller Options**:
   - On the **Domain Controller Options** page, select the appropriate options:
     - **Domain Name System (DNS) server** is selected by default.
     - Set a **Directory Services Restore Mode (DSRM) password**, then click **Next**.

4. **DNS Delegation**:
   - If you're adding a new forest, you may get a warning about DNS delegation. You can ignore this and click **Next**.

5. **Additional Options**:
   - On the **Additional Options** page, ensure the **NetBIOS domain name** is correct and click **Next**.

6. **Paths**:
   - Specify the **Database**, **Log Files**, and **SYSVOL** paths, or leave the default locations. Click **Next**.

7. **Review and Install**:
   - Review all the configuration settings on the **Review Options** page, then click **Next**.

8. **Prerequisites Check**:
   - The system will perform a prerequisites check. Once the check completes successfully, click **Install**.

### 3. **Reboot the Server**

After the installation and configuration process, the server will automatically reboot. Once it restarts, the server will be promoted as a Domain Controller.

### 4. **Verify AD DS Installation**

To ensure AD DS is installed and running:
- Open **Server Manager** and verify that **Active Directory Domain Services** appears in the left pane under **Roles and Features**.
- Open **Active Directory Users and Computers** by typing `dsa.msc` in the **Run** dialog to manage your domain.

Now your Windows Server is installed with Active Directory Domain Services and is configured as a Domain Controller.

----

## Rename Builtin Admin

To rename the default **Administrator** account after installing Active Directory Domain Services on Windows Server, follow these steps:

### Using Active Directory Users and Computers (GUI):

1. **Open Active Directory Users and Computers**:
   - Press `Win + R`, type `dsa.msc`, and hit **Enter**.

2. **Navigate to the Administrator Account**:
   - In the console tree, expand your domain and go to **Users** (located under your domain name).

3. **Locate the Administrator Account**:
   - Scroll down to find the **Administrator** account.

4. **Right-click the Administrator Account**:
   - Select **Rename** from the context menu.

5. **Rename the Account**:
   - Enter the new name for the account and press **Enter**.

6. **Update Additional Fields**:
   - A dialog box will appear prompting you to update fields like the **Full Name** and **Display Name**. Adjust these as necessary.

7. **Save Changes**:
   - Click **OK** to apply the changes.

### Using PowerShell:

You can also rename the default administrator account using PowerShell with the following command:

1. **Open PowerShell as Administrator**:
   - Right-click on the **Start** button and select **Windows PowerShell (Admin)**.

2. **Rename the Administrator Account**:
   Run the following command, replacing "NewAdminName" with your desired name:

   ```powershell
   Rename-LocalUser -Name "Administrator" -NewName "NewAdminName"
   ```

3. **Verify the Change**:
   - You can confirm the renaming by running:

   ```powershell
   Get-LocalUser -Name "NewAdminName"
   ```

After renaming, ensure that you update any references to the default **Administrator** account in group policies, scheduled tasks, or login scripts.

----

### Notes on NetBIOS, Computer Name, and Related Concepts

#### **NetBIOS Overview**:
- **NetBIOS (Network Basic Input/Output System)** is a protocol that allows applications on different computers to communicate within a local area network (LAN). 
- **Computer Name (NetBIOS Name)**: This is a unique identifier for each computer on the network. It allows computers to be identified and communicate in networks without requiring DNS.
- **When DNS Fails**: If **DNS** (Domain Name System) is unresponsive, **NetBIOS** provides a fallback mechanism for identifying computers on the network using their **NetBIOS names**.
  - For example, when a domain-joined PC tries to resolve names for network resources, it will use DNS first. If DNS doesn't respond, NetBIOS can step in to provide name resolution.

#### **SYSVOL Folder**:
- **SYSVOL** is a shared directory that stores domain-wide files that are replicated between domain controllers. It primarily contains:
  - Group Policy templates (GPOs)
  - Login scripts
  - Other essential files needed by domain controllers.
- The **SYSVOL** folder can typically be found under: `C:\Windows\SYSVOL`.

#### **NTDS and Database Files**:
- **NTDS** stands for **NT Directory Services**.
- **NTDS.dit** is the Active Directory database file where all domain information, including user objects, groups, and security policies, is stored.
  - It is located at `C:\Windows\NTDS\ntds.dit`.
  - This file contains the entire directory information for the domain, and it is crucial for Active Directory operations.

#### **Log Files**:
- Active Directory uses log files to track changes and transactions made in the **NTDS.dit** database.
- These logs are stored alongside the database file and are used to maintain database consistency and recover from failures.
  - Example location: `C:\Windows\NTDS\Logs`.

### **DNS Workload and NetBIOS Login**:
- **DNS Workload**: When a user logs into a domain, DNS is typically responsible for resolving the domain controller’s IP address. If the DNS server is unavailable, the system might use **NetBIOS** to resolve the name of the domain controller.
- **Logging in with NetBIOS Name**: When logging into a domain, users can use the **NetBIOS name** of the domain if DNS is unavailable.
  - For example, you can log in as `DOMAIN\Username` (where **DOMAIN** is the NetBIOS name of the domain).
  
#### **Local Login vs Domain Login**:
- **Domain Login**: Uses the domain's DNS or NetBIOS name, as in `DOMAIN\Username`. This login checks the user's credentials against the domain controller.
- **Local Login**: To log in to the local computer (not using the domain), you can use **.\Username**. This tells the system to check the local security accounts manager (SAM) database instead of the domain.
  - Example: `.\Administrator` to log in as the local admin.

#### **Useful Commands/Shortcuts**:
1. **sysdm.cpl**: Opens the **System Properties** window, where you can configure system settings such as computer name, domain/workgroup settings, and more.
   - To access it: Press `Win + R`, type `sysdm.cpl`, and press **Enter**.
   
2. **ncpa.cpl**: Opens the **Network Connections** window, where you can view and configure network adapters.
   - To access it: Press `Win + R`, type `ncpa.cpl`, and press **Enter**.

These concepts form the foundation for understanding how domain name resolution, network logins, and Active Directory operate in a Windows Server environment.

----

## Azure Class Notes:

***************************************
dns...console...server....forward and reverse lookup zones

forward corvit.local zone.... its also called forest or domain etc.   and records in it

its self record .... see its fqdn that will be dc01.corvit.local

we can restart this dns server in console...  also stop or pause

active directory... console.... domain that is corvit.local

users container (CN) and builtin container ...?

enterprize admin ... work with adding other DC etc
schema admin.. change DC database
group policy admin... create group policy

change default user: administrator..... go to tools ...users and computers... users container... right click ...rename... change user name and select login types:  (dns and netbios)

recover a deleted user: tools .... active directory administrative centre... extra containers... select domain and enable recycle bin....  open deleted objects container... refresh,,, right click and restore.... or restore to if object not found error...

 ======================================
member server....any server that supports the domain.... move these machines to member server OU
check point in hyper v
check user profile type in sysdm.cpl,,,, advance,,,, user profile,,, type
shift profile from local to server: make a 'File Server' and add a additional drive (e.g name: profile data) to it.
 
==========================================================
domain users profiling
profile tab on users properties
go to new drive in file server,,,, create a folder for every department....like sales...share this folder...advance sharing,,, share
name: sales$..... dollar sign with hide it from network discovery,,,, share with user 1 and 2... or to a 
group= authenticated users...  copy its network path... sharing is done,,, now in security tab.... remove extra users and group
from here... if not removed just disabel inheretence with two options,,, select explicit option,,,, remove form here in advance
then from normal permissions.... just left system, creater and if required then local administrator,,,, add authenticated users 
with full permissions,,,, in active directory ,,,, select multiple user,,, its properties and set that network path of 
file server,,,, append \%username% ... 
verify a single user profile path... finaly refresh it.... login again sales users,, 
profile is made acording to the version of windows. e.g v5,v6 etc.
if user install other version try to make new profile ,,,
authenticated user: every domain user
everyone: systems local users
network discory to see every share folder in network.
user syncs if proper logoff...
when copy user,,, profile is also set automatically...

ADC - Additional Domain Controller

eventvwr.msc

Check replication: repadmin /replsummary

Check replication method 2: Active Directory Sites and Services:
Press Win + R, type dssite.msc

Check NTDS Settings:
The NTDS settings hold replication-related data and can give insights into replication health.
Check replication partners using:
repadmin /showreps


DC Diagonastic: The dcdiag tool is a diagnostic utility for domain controllers.
command:   dcdiag /v

To target specific tests:

dcdiag /test:<TestName>

Example tests:

    dcdiag /test:DNS: Tests DNS configuration and issues.
    dcdiag /test:replications: Tests replication health.

Verify FSMO role health with:
netdom query fsmo

Ensure the SYSVOL and NETLOGON shares are accessible and replicated across domain controllers. You can check by visiting:
\\<DC-Name>\SYSVOL
\\<DC-Name>\NETLOGON
