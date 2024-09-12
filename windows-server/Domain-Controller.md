guide

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

## Azure Class Notes:

netbios - computer name, when dns not respond, netbios respond.

sysdm.cpl
ncpa.cpl

SYSVOL file
Database file NTDS  ---- ntds.dit (database file.....c:\windows\NTDS)
log file

dns workload,,,, login with netbios name(domain login) ,,,, login with .\ (local login) 
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
