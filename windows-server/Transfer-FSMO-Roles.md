To transfer FSMO (Flexible Single Master Operations) roles from one Active Directory (AD) server to another, you can do this through the GUI (Graphical User Interface) or the command line.

### **Using GUI:**

1. **Open Active Directory Users and Computers (ADUC):**
   - On the current FSMO role holder, open **Active Directory Users and Computers**.
   - Right-click on the **domain name** (root of the tree), and select **Operations Masters**.

2. **Transfer FSMO Roles:**
   - In the Operations Masters window, you’ll see tabs for each of the FSMO roles:
     - **PDC (Primary Domain Controller) Emulator**
     - **RID (Relative ID) Master**
     - **Infrastructure Master**
     - **Schema Master** (use **Active Directory Schema** MMC)
     - **Domain Naming Master** (use **Active Directory Domains and Trusts** MMC)

3. **Select the Role:**
   - For each FSMO role, you can click on the **Change** button to transfer the role to another domain controller. You need to select the domain controller that you want to transfer the role to.

4. **Confirm the Transfer:**
   - Click **Yes** when prompted to confirm the role transfer.

### **Using Command Line:**

To transfer FSMO roles using the command line, you can use **ntdsutil** or PowerShell.

#### **Using NTDSUTIL:**

1. **Open Command Prompt** as an administrator.
2. Run the following command to open **ntdsutil**:

   ```bash
   ntdsutil
   ```

3. Type the following to connect to the target server:

   ```bash
   roles
   ```

4. Now, to transfer a role to another domain controller, type:

   ```bash
   transfer <role>
   ```

   Where `<role>` can be one of the following:

   - `PDC` – PDC Emulator
   - `RID` – RID Master
   - `INFRASTRUCTURE` – Infrastructure Master
   - `SCHEMA` – Schema Master
   - `DOMAIN` – Domain Naming Master

   For example, to transfer the PDC role, use:

   ```bash
   transfer PDC
   ```

5. Type `quit` to exit the tool.

#### **Using PowerShell:**

PowerShell offers cmdlets to manage FSMO roles.

1. Open **PowerShell** as an administrator.
2. Use the following cmdlets to transfer the FSMO roles.

   - To transfer the **PDC Emulator** role:

     ```powershell
     Move-ADDirectoryServerOperationMasterRole -Identity "NewServerName" -OperationMasterRole PDCEmulator
     ```

   - To transfer the **RID Master** role:

     ```powershell
     Move-ADDirectoryServerOperationMasterRole -Identity "NewServerName" -OperationMasterRole RIDMaster
     ```

   - To transfer the **Infrastructure Master** role:

     ```powershell
     Move-ADDirectoryServerOperationMasterRole -Identity "NewServerName" -OperationMasterRole InfrastructureMaster
     ```

   - To transfer the **Schema Master** role:

     ```powershell
     Move-ADDirectoryServerOperationMasterRole -Identity "NewServerName" -OperationMasterRole SchemaMaster
     ```

   - To transfer the **Domain Naming Master** role:

     ```powershell
     Move-ADDirectoryServerOperationMasterRole -Identity "NewServerName" -OperationMasterRole DomainNamingMaster
     ```

   Make sure to replace `"NewServerName"` with the name of the target server that will take the FSMO roles.

---

### **Verification:**

After transferring the FSMO roles, you can verify the successful transfer using the following command in **PowerShell**:

```powershell
Get-ADDomain -Identity <DomainName> | Select-Object -ExpandProperty FSMORoleOwner
```

This will show the current server holding the FSMO roles for your domain.

Also, you can use **ntdsutil** for verification:

```bash
ntdsutil
roles
connections
connect to server <ServerName>
q
```

This will show you which server holds the FSMO roles.

--- 

By using either the GUI or command line, you can effectively transfer FSMO roles between domain controllers in an Active Directory environment.
