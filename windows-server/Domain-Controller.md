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
