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

## Transferring FSMO Roles**:

- **Using MMC Snap-ins**:
  - **Schema Master**: `Active Directory Schema` MMC snap-in.
  - **Domain Naming Master**: `Active Directory Domains and Trusts` MMC snap-in.
  - **PDC Emulator, RID Master, and Infrastructure Master**: `Active Directory Users and Computers` MMC snap-in.
  
Right-click the domain controller holding the role and select **Operations Master** to transfer.

- **Using PowerShell**:
```powershell
Move-ADDirectoryServerOperationMasterRole -Identity "NewDC" -OperationMasterRole SchemaMaster, DomainNamingMaster, PDCEmulator, RIDMaster, InfrastructureMaster
```

**c. Seizing FSMO Roles**:
- **When a role holder is unavailable**, use the `ntdsutil` tool to seize the role. This should be done with caution and typically as a last resort.
  ```cmd
  ntdsutil
  roles
  connections
  connect to server <ServerName>
  quit
  seize <RoleName>
  ```

---

# **Managing FSMO Roles in Active Directory**

1. **Accessing FSMO Roles:**

   To manage FSMO (Flexible Single Master Operation) roles in Active Directory:

   - Open **Active Directory Users and Computers (ADUC)**.
   - Right-click on the **Active Directory Domain Controller** name.
   - Select **Operations Masters** from the context menu.

2. **Operations Masters Dialog:**

   The **Operations Masters** dialog box appears, showing the FSMO roles held by the current domain controller.

   In this dialog, you will see the following FSMO roles:

   - **Schema Master**: Manages updates to the Active Directory schema. There can be only one Schema Master in the forest.
   - **Domain Naming Master**: Manages changes to the forest-wide domain namespace. There can be only one Domain Naming Master in the forest.
   - **RID Master**: Allocates pools of unique identifiers (RIDs) to other domain controllers for creating security principals. Each domain has one RID Master.
   - **PDC Emulator**: Acts as a backup domain controller for legacy systems and manages password changes. Each domain has one PDC Emulator.
   - **Infrastructure Master**: Updates references to objects in other domains. Each domain has one Infrastructure Master.

3. **Changing FSMO Roles:**

   To transfer or seize FSMO roles:

   - **Transfer**: Use the **Change** button to transfer the role to another domain controller. This is the recommended method when moving roles between operational domain controllers.
   - **Seize**: This option is used if the current role holder is permanently unavailable. Use it with caution as it can lead to conflicts.

4. **Post-Change Actions:**

   - **Verify**: After changing FSMO roles, verify that the new role holder is functioning correctly.
   - **Replication**: Ensure that Active Directory replication occurs successfully so that all domain controllers are updated with the new FSMO role holder information.

### **Summary**

To manage FSMO roles, right-click the domain controller in **Active Directory Users and Computers**, select **Operations Masters**, and view or change the roles. The roles include Schema Master, Domain Naming Master, RID Master, PDC Emulator, and Infrastructure Master. Use the **Change** button to transfer roles and the **Seize** button for urgent role changes. Always verify and ensure proper replication after any changes.

---

## 5. Best Practices:

- **Regular Monitoring**: Regularly check the health and status of FSMO roles.
- **Redundancy**: Ensure that FSMO roles are not hosted on a single domain controller to avoid single points of failure.
- **Documentation**: Keep detailed documentation of FSMO role assignments and any changes made.

FSMO roles are vital for maintaining the stability and reliability of an Active Directory environment, and understanding their functions and management is crucial for effective AD administration.
