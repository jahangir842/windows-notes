### **Detailed Notes: Managing Active Directory Domain Controllers and Diagnostics**

---

#### **1. Additional Domain Controller (ADC)**

An **Additional Domain Controller** (ADC) is a secondary domain controller that is part of an existing domain within an Active Directory infrastructure. It provides redundancy and load balancing for key services like **authentication**, **replication**, and **directory services**. The role of an ADC is critical in disaster recovery scenarios since it maintains a copy of the **Active Directory database** and shares the load with the primary domain controller.

- **Purpose**:
  - **Redundancy**: Ensures fault tolerance by providing a backup in case the primary domain controller fails.
  - **Load Balancing**: Distributes the workload, especially in environments with a large number of users and devices.
  - **Replication**: The ADC receives and replicates data from the primary domain controller, ensuring consistency across domain controllers.

---

#### **2. Event Viewer: Checking Domain Controller Logs (eventvwr.msc)**

To troubleshoot Active Directory issues, you can use **Event Viewer**. It helps to identify any errors or warnings related to domain controllers.

- **How to Access**:
  1. Press `Win + R`.
  2. Type `eventvwr.msc` and press Enter.
  3. Go to **Windows Logs** > **System** or **Application** to check for events related to domain controllers, replication issues, and more.

Event logs can help identify specific issues related to Active Directory or domain replication.

---

#### **3. Check Replication Status: `repadmin /replsummary`**

Replication between domain controllers is critical for keeping data synchronized. The **repadmin** tool helps monitor and manage replication between domain controllers.

- **Command**:  
  To get a summary of replication across all domain controllers:
  ```bash
  repadmin /replsummary
  ```

- **Output**:  
  This command will show the **success and failure** status for each domain controller involved in replication. It helps detect any replication issues that may arise between domain controllers.

---

#### **4. Check Replication Method 2: Active Directory Sites and Services**

Another way to check replication between domain controllers is through the **Active Directory Sites and Services** management console.

- **How to Access**:
  1. Press `Win + R`.
  2. Type `dssite.msc` and press Enter.
  3. In the console, you can view and manage the **sites**, **subnets**, and **replication** between domain controllers.

---

#### **5. Check NTDS Settings and Replication Partners**

The **NTDS Settings** are critical for managing and viewing replication information. They store replication data and configuration information for domain controllers.

- **How to check replication partners**:
  - You can view replication partners and the replication status using the command:
  ```bash
  repadmin /showreps
  ```

This command will show detailed information about replication for each domain controller, including its **replication partners**, the **last attempt**, and **status**.

---

#### **6. Domain Controller Diagnostics (`dcdiag`)**

The `dcdiag` tool is used to perform various health checks on a domain controller. It provides diagnostic information about the state of the domain controller and helps identify issues.

- **Basic Command**:
  ```bash
  dcdiag /v
  ```
  The `/v` flag stands for verbose output, which gives more detailed information on the health of the domain controller.

---

#### **7. Target Specific Tests with `dcdiag`**

You can run specific tests using the `dcdiag` command to focus on particular issues, such as DNS or replication health.

- **DNS Test**:
  This checks if the domain controller's **DNS configuration** is set up correctly.
  ```bash
  dcdiag /test:DNS
  ```

- **Replication Test**:
  This checks if the **replication health** between domain controllers is working properly.
  ```bash
  dcdiag /test:replications
  ```

---

#### **8. Verify FSMO Roles with `netdom query fsmo`**

In a Windows Active Directory environment, **FSMO (Flexible Single Master Operations)** roles are special roles held by one or more domain controllers. These roles must be healthy and functioning to ensure the proper operation of the domain.

- **Command to Check FSMO Role Holders**:
  ```bash
  netdom query fsmo
  ```

  This command will show which domain controllers hold the various FSMO roles, such as **Schema Master**, **Domain Naming Master**, **RID Master**, **PDC Emulator**, and **Infrastructure Master**.

---

#### **9. Check SYSVOL and NETLOGON Shares**

The **SYSVOL** and **NETLOGON** shares must be accessible on all domain controllers for proper functionality of group policies and login scripts.

- **How to check if these shares are available**:
  - Open a **Run** dialog (`Win + R`) and enter:
    ```bash
    \\<DomainControllerName>\SYSVOL
    \\<DomainControllerName>\NETLOGON
    ```
  - If these shares are not accessible, it indicates potential issues with replication or file sharing on the domain controller.

- **Importance of SYSVOL and NETLOGON**:
  - **SYSVOL**: Stores Group Policy objects and scripts.
  - **NETLOGON**: Used for storing login scripts and authenticating domain logins.

---

### **Summary**

- **ADC (Additional Domain Controller)**: A secondary domain controller for redundancy and load balancing.
- **Event Viewer** (`eventvwr.msc`): Useful for checking logs related to domain controllers and identifying issues.
- **Replication Check** (`repadmin /replsummary`): Provides a summary of replication between domain controllers.
- **Active Directory Sites and Services**: Useful for managing sites, subnets, and replication.
- **NTDS Settings**: Hold replication data. Use `repadmin /showreps` to check replication partners.
- **Diagnostic Tool** (`dcdiag`): Helps diagnose domain controller health and specific tests can target DNS or replication issues.
- **FSMO Roles**: Verify FSMO roles with `netdom query fsmo`.
- **SYSVOL and NETLOGON**: Ensure these shares are accessible and replicated across domain controllers.

These tools and commands help ensure the health and functionality of Active Directory domain controllers, making it easier to troubleshoot and maintain a stable Active Directory environment.
