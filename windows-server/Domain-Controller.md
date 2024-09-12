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

#### **Useful Commands/Shortcuts**:
1. **sysdm.cpl**: Opens the **System Properties** window, where you can configure system settings such as computer name, domain/workgroup settings, and more.
   - To access it: Press `Win + R`, type `sysdm.cpl`, and press **Enter**.
   
2. **ncpa.cpl**: Opens the **Network Connections** window, where you can view and configure network adapters.
   - To access it: Press `Win + R`, type `ncpa.cpl`, and press **Enter**.

---

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

### `ntds.dit`: Active Directory Database File**
- **Purpose**: The `ntds.dit` file is the primary database file for Active Directory, containing all directory data, including user accounts, groups, and other AD objects.
- **Location**: Found at `C:\Windows\NTDS`.
- **Functions**:
  - Stores all Active Directory information and is essential for the operation of AD services.
  - Handles data like user credentials, computer accounts, and directory service data.

### Active Directory Log Files**
- **Purpose**: These log files track changes and transactions in the Active Directory database, ensuring data integrity and supporting recovery operations.
- **Location**: Typically stored in `C:\Windows\NTDS`.
- **Functions**:
  - **EDB.LOG**: The main transaction log file.
  - **EDB.CHK**: A checkpoint file that tracks the last transaction committed to the database.
  - Supports recovery in case of unexpected shutdowns or crashes.

### **DNS Workload and NetBIOS Login**:
- **DNS Workload**: When a user logs into a domain, DNS is typically responsible for resolving the domain controller’s IP address. If the DNS server is unavailable, the system might use **NetBIOS** to resolve the name of the domain controller.
- **Logging in with NetBIOS Name**: When logging into a domain, users can use the **NetBIOS name** of the domain if DNS is unavailable.
  - For example, you can log in as `DOMAIN\Username` (where **DOMAIN** is the NetBIOS name of the domain).

### **Understanding Domain and Local Logins in Windows**

#### **1. Domain Login**
- **Purpose**: Allows users to authenticate and access resources within a Windows domain managed by Active Directory.
- **Login Format**: 
  - **Using Full Domain Name**: `username@domain.com`
  - **Using NETBIOS Name**: `DOMAIN\username`
  - **NETBIOS Name**: A shorter, simpler version of the domain name used for compatibility with older systems.
- **Example**:
  - **Domain Name**: `example.com`
  - **NETBIOS Name**: `EXAMPLE`
  - **Login**: `EXAMPLE\username` or `username@example.com`

#### **2. Local Login**
- **Purpose**: Allows users to authenticate and access resources on the local machine, independent of any domain.
- **Login Format**:
  - **Using Local Machine Name**: `MACHINE_NAME\username`
  - **Using Local Login Shortcut**: `.\username`
- **Explanation**:
  - The `.\` prefix forces Windows to authenticate the user against the local machine's accounts instead of domain accounts.
  - It is useful when the same username exists both locally and in the domain or when the network is unavailable.
- **Example**:
  - **Local Machine Name**: `MACHINE1`
  - **Login**: `.\username` or `MACHINE1\username`

#### **Use Cases**
- **Domain Login**: Ideal for accessing shared resources, applications, and settings configured by IT across an organization.
- **Local Login**: Necessary for administrative tasks on a local machine, troubleshooting domain login issues, or when a domain is not available. 

Understanding these different login methods helps ensure proper access to resources, whether on a local machine or within a domain environment.

---

### **Active Directory Functional Levels**

**Functional Levels** determine the features and capabilities available in a domain or forest in Active Directory. They specify the minimum Windows Server version required for domain controllers.

#### **1. Domain Functional Level (DFL)**
- **Purpose**: Controls features within a single domain.
- **Levels**:
  - **Windows 2000** to **Windows Server 2022**.
- **Considerations**:
  - Raising the level enables new features but requires all domain controllers to use the corresponding Windows Server version.
  - Once raised, it cannot be downgraded.

#### **2. Forest Functional Level (FFL)**
- **Purpose**: Controls features across all domains in a forest.
- **Levels**:
  - **Windows 2000** to **Windows Server 2022**.
- **Considerations**:
  - Raising the level enables forest-wide features and requires all domains to meet the corresponding version.
  - Once raised, it cannot be downgraded.

#### **Checking and Raising Levels**
- **Check**: Use Active Directory Users and Computers or PowerShell cmdlets (`Get-ADDomain`, `Get-ADForest`).
- **Raise**: Use Active Directory Users and Computers or PowerShell cmdlets (`Set-ADDomainMode`, `Set-ADForestMode`).

---

### **Global Catalog in Active Directory**

**Purpose**:
- **Facilitates Searches**: Provides a searchable index of all objects across the forest.
- **Supports Logins**: Essential for user logins and cross-domain authentication.

**Functionality**:
- **Partial Attribute Set**: Contains a subset of attributes for every object in the forest.
- **Domain Controllers**: At least one per domain should be a Global Catalog server.

**Configuration**:
- **Enable GC**: In Active Directory Sites and Services, check the "Global Catalog" option for the domain controller.

**Considerations**:
- **Performance**: GC can impact performance due to replication and indexing.
- **Availability**: Ensure multiple GC servers for redundancy and efficient directory access.

---

On the DNS Options page, you’ll see an error message stating that there’s no parent zone found and no delegation for your DNS server could be created. Ignore this message and click the “next” button, leaving all the settings at this checkpoint unchanged.

---

NOTE: Whenever you need to add a new forest, make sure that you are logged into the server as the local administrator of that machine. You can always add more domain controllers to your server. However, you must be a member of the domain administrators’ group to be able to do so.

---

## Azure Class Notes:

***************************************


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
