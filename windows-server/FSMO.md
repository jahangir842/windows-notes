# Flexible Single Master Operations (FSMO)

**Flexible Single Master Operations (FSMO)** roles are critical components in the management and operation of an Active Directory (AD) environment. These roles ensure that certain domain-wide operations are performed in a consistent manner across the domain and forest.

### Key Points About FSMO Roles

---

## 1. Overview of FSMO Roles:

FSMO roles are specialized domain controller tasks within an Active Directory environment. There are five FSMO roles divided into two categories: Forest-wide roles and Domain-wide roles.

---

## 2. Forest-wide FSMO Roles:

**a. Schema Master**:
- **Function**: Manages updates to the AD schema. It is responsible for handling schema modifications and ensuring that all domain controllers in the forest receive schema updates.
- **Location**: There is only one Schema Master per forest.
- **Management**: Use the `Active Directory Schema` MMC snap-in or PowerShell cmdlets to manage.

**b. Domain Naming Master**:
- **Function**: Handles changes to the domain namespace in the forest. It is responsible for adding or removing domains within the forest.
- **Location**: There is only one Domain Naming Master per forest.
- **Management**: Use the `Active Directory Domains and Trusts` MMC snap-in or PowerShell cmdlets to manage.

---

## 3. Domain-wide FSMO Roles:

**a. PDC Emulator**:
- **Function**: Acts as a Primary Domain Controller (PDC) for legacy NT4 clients and applications. It also handles password changes and account lockouts, and it is the authoritative time source for the domain.
- **Location**: There is one PDC Emulator per domain.
- **Management**: Use the `Active Directory Users and Computers` MMC snap-in or PowerShell cmdlets to manage.

**b. RID Master**:
- **Function**: Allocates pools of relative identifiers (RIDs) to domain controllers within the domain. RIDs are used to create security principals like users and groups.
- **Location**: There is one RID Master per domain.
- **Management**: Use the `Active Directory Users and Computers` MMC snap-in or PowerShell cmdlets to manage.

**c. Infrastructure Master**:
- **Function**: Updates references to objects in other domains. It ensures that object references are correctly updated and maintained across domains.
- **Location**: There is one Infrastructure Master per domain.
- **Management**: Use the `Active Directory Users and Computers` MMC snap-in or PowerShell cmdlets to manage.

---

## 4. Managing FSMO Roles:

**a. Checking FSMO Role Holders**:

To check the health and status of FSMO roles in an Active Directory environment, you can use
- **Command Prompt**:
  ```cmd
  netdom query fsmo
  ```
Description: This command lists all FSMO role holders in the domain and forest.

  
- **PowerShell**:
  ```powershell
  Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster
  Get-ADDomain | Select-Object PDCEmulator, RIDMaster, InfrastructureMaster
  ```

## Using Active Directory Tools

### Open Active Directory Users and Computers (ADUC):

Run dsa.msc to open Active Directory Users and Computers.

### View Operations Masters:

Right-click on the domain and select Operations Masters.
This window shows the PDC Emulator, RID Master, and Infrastructure Master.

## Active Directory Domains and Trusts:

### Open AD Domains and Trusts:
Run domain.msc to open Active Directory Domains and Trusts.

### View Domain Naming Master:
Right-click on the root domain and select Operations Master.
This window shows the Domain Naming Master.

### c. Active Directory Schema:

Register Schema Snap-in (if not already registered):
Run the following command:

```
regsvr32 schmmgmt.dll
```

## Open Schema Snap-in:

Run **mmc** to open Microsoft Management Console.
Go to **File** > **Add/Remove Snap-in**, add **Active Directory Schema**, and click **Add**.

## View Schema Master:

Right-click on Active Directory Schema and select Operations Master.
This window shows the Schema Master.

---

### **How to Change FSMO Roles in Active Directory**

Changing FSMO (Flexible Single Master Operation) roles involves transferring or seizing roles between domain controllers. This process ensures that the roles are assigned to the appropriate server, either due to planned changes or in response to server failures.

Here’s how you can change FSMO roles:

#### **Transferring FSMO Roles**

Transferring FSMO roles is the preferred method when moving roles between domain controllers that are online and functioning correctly. The transfer is done using the Active Directory management tools.

1. **Using Active Directory Users and Computers (ADUC):**

   - **Open ADUC**:
     - Launch the **Active Directory Users and Computers** console.
   - **Access Operations Masters**:
     - Right-click on the **Active Directory Domain Controller** name (usually at the top of the domain).
     - Select **Operations Masters**.
   - **Select the Role to Transfer**:
     - In the **Operations Masters** dialog box, select the tab corresponding to the role you wish to transfer (RID, PDC, or Infrastructure).
   - **Transfer the Role**:
     - Click **Change** to transfer the role to another domain controller. 
     - Confirm the transfer in the dialog box that appears.

2. **Using Active Directory Schema Snap-in (Schema Master):**

   - **Register the Schema Snap-in**:
     - Open a Command Prompt as an administrator.
     - Run `regsvr32 schmmgmt.dll` to register the schema management snap-in.
   - **Open the Schema Snap-in**:
     - Open **MMC** (Microsoft Management Console) and add the **Active Directory Schema** snap-in.
   - **Transfer the Role**:
     - Right-click **Active Directory Schema** and select **Operations Master**.
     - Choose the domain controller to which you want to transfer the schema role and click **Change**.

3. **Using Active Directory Domains and Trusts (Domain Naming Master):**

   - **Open AD Domains and Trusts**:
     - Launch **Active Directory Domains and Trusts**.
   - **Access Operations Master**:
     - Right-click on **Active Directory Domains and Trusts** at the top of the console tree.
     - Select **Operations Master**.
   - **Transfer the Role**:
     - Choose the domain controller to which you want to transfer the domain naming master role and click **Change**.

#### **Seizing FSMO Roles**

Seizing FSMO roles is used when a domain controller holding a role is permanently unavailable or cannot be brought back online. This should be done with caution as it can lead to data inconsistencies if the original role holder is restored.

1. **Using the Ntdsutil Tool:**

   - **Open Command Prompt**:
     - Run **Command Prompt** as an administrator.
   - **Start Ntdsutil**:
     - Type `ntdsutil` and press **Enter**.
   - **Access FSMO Maintenance**:
     - Type `roles` and press **Enter** to access FSMO role maintenance.
   - **Connect to the Server**:
     - Type `connections` and press **Enter**.
     - Type `connect to server <server_name>` where `<server_name>` is the domain controller that will hold the FSMO roles.
     - Type `quit` to return to the FSMO maintenance menu.
   - **Seize the Roles**:
     - Type `seize <role>` where `<role>` is one of the FSMO roles (e.g., `seize rid master`, `seize pdc`, `seize infrastructure master`, etc.).
     - Confirm the seizure when prompted.

#### **Post-Change Actions**

1. **Verify**:
   - Check that the new FSMO role holder is functioning correctly.
   - Use tools like **Active Directory Users and Computers**, **AD Domains and Trusts**, or **AD Schema Snap-in** to verify the role assignment.

2. **Replication**:
   - Ensure that Active Directory replication is occurring correctly across all domain controllers.
   - Use tools like **repadmin** to check replication status.

### **Summary**

To change FSMO roles, you can transfer roles using the ADUC, AD Schema Snap-in, or AD Domains and Trusts for online domain controllers. For a domain controller that is permanently unavailable, use the `ntdsutil` tool to seize FSMO roles. Always verify and ensure replication after changing FSMO roles to maintain a consistent Active Directory environment.

---

## 5. Best Practices:

- **Regular Monitoring**: Regularly check the health and status of FSMO roles.
- **Redundancy**: Ensure that FSMO roles are not hosted on a single domain controller to avoid single points of failure.
- **Documentation**: Keep detailed documentation of FSMO role assignments and any changes made.

FSMO roles are vital for maintaining the stability and reliability of an Active Directory environment, and understanding their functions and management is crucial for effective AD administration.
