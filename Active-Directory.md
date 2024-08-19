### **Windows Active Directory Files Overview**

#### **1. SYSVOL Folder**
- **Purpose**: SYSVOL (System Volume) is a shared directory on domain controllers in a Windows Server environment that stores group policy data, scripts, and other critical files necessary for Active Directory (AD) replication across the domain.
- **Location**: Typically found at `C:\Windows\SYSVOL`.
- **Functions**:
  - Stores Group Policy Objects (GPOs) and login/logoff scripts.
  - Replicated across all domain controllers to ensure consistency in the domain.

#### **2. `ntds.dit`: Active Directory Database File**
- **Purpose**: The `ntds.dit` file is the primary database file for Active Directory, containing all directory data, including user accounts, groups, and other AD objects.
- **Location**: Found at `C:\Windows\NTDS`.
- **Functions**:
  - Stores all Active Directory information and is essential for the operation of AD services.
  - Handles data like user credentials, computer accounts, and directory service data.

#### **3. Active Directory Log Files**
- **Purpose**: These log files track changes and transactions in the Active Directory database, ensuring data integrity and supporting recovery operations.
- **Location**: Typically stored in `C:\Windows\NTDS`.
- **Functions**:
  - **EDB.LOG**: The main transaction log file.
  - **EDB.CHK**: A checkpoint file that tracks the last transaction committed to the database.
  - Supports recovery in case of unexpected shutdowns or crashes.
