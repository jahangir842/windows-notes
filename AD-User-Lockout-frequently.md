### **Phase 1: Trace the Lockout (On Domain Controller)**

**Goal:** Identify *where* the bad password is coming from.

1. **Open Event Viewer:**
* Go to `Windows Logs` > `Security`.


2. **Filter for the Lockout Event:**
* Filter the log for **Event ID 4740**.


3. **Analyze the Event:**
* Open the latest 4740 event.
* Look for the field: **"Caller Computer Name"**.
* *Result:* This tells you exactly which server or workstation is generating the bad password.



> **Pro Tip:** If the "Caller Computer Name" is **blank** or shows a generic name (like a CAS server), the source is likely external to the Windows domain, such as:
> * A RADIUS Server (Wi-Fi)
> * A VPN Concentrator
> * Exchange ActiveSync (Mobile Device)
> 
> 

---

### **Phase 2: Remediate the Source (On the Caller Machine)**

**Goal:** Find and remove the cached credential on the specific machine identified in Phase 1.

**1. Service Control Manager**

* **Command:** `services.msc`
* **Action:** Click the column header **"Log On As"** to sort.
* **Check:** Look for any service running as the specific domain admin account (not LocalSystem).

**2. Task Scheduler**

* **Action:** Open Task Scheduler.
* **Quick Check:** In the right-hand "Actions" pane, click **"Display All Running Tasks"** to see what is active *right now*.
* **Deep Check:** Review task properties to see if the "Run as" user is the locked-out account.

**3. IIS Application Pools (Web Servers)**

* **Command:** Press `Win + R`, type `inetmgr`, and hit Enter.
* **Action:** Go to **Application Pools**.
* **Check:** Look at the **"Identity"** column. If you see the admin username here, this is likely the culprit.

**4. Credential Manager**

* **Location:** Control Panel > User Accounts > Credential Manager.
* **Check:** Look under "Windows Credentials" for old stored RDP, file share, or browser credentials utilizing the admin account.

**5. Disconnected RDP Sessions**

* **Issue:** A user might have logged in weeks ago, disconnected (without signing out), and the session is still trying to refresh usage with an old password.
* **Fix:** Force log off any disconnected sessions for that user.

---

### **Phase 3: The Azure & Network Context**

Since the environment involves Azure and Windows Server 2016, ask these diagnostic questions:

* **Azure AD Connect:** "Are you using Azure AD Connect? Sometimes password write-back latency can cause confusion, though it rarely triggers a repeated lockout on a specific DC."
* **Network Topology:** "Is the 'Caller Machine' a VM inside the same Azure VNet, or is the traffic coming over a Site-to-Site VPN from an on-premise office?"

---

### **Phase 4: Prerequisites (Enable Audit Policies)**

If logs are missing, you must ensure the Domain Controller is actually configured to record them.

**Method: via Group Policy Management**

1. Open **Group Policy Management** (`gpmc.msc`).
2. Navigate to: `Forest` > `Domains` > `[YourDomain.local]` > `Domain Controllers` OU.
3. Right-click **Default Domain Controllers Policy** and select **Edit**.

**Setting A: The Modern Method (Advanced Audit Policy)**

* *Path:* `Computer Configuration` > `Policies` > `Windows Settings` > `Security Settings` > `Advanced Audit Policy Configuration` > `Audit Policies`.
* **Account Management:** Enable **Audit User Account Management** (Success & Failure).
* *Triggers:* **Event ID 4740** (Lockout).


* **Logon/Logoff:** Enable **Audit Logon** (Success & Failure).
* *Triggers:* **Event ID 4625** (Failed Logon Attempt).



**Setting B: The Legacy Method (Local Policies)**

* *Path:* `Computer Configuration` > `Policies` > `Windows Settings` > `Security Settings` > `Local Policies` > `Audit Policy`.
* **Action:** Enable **Audit account logon events** and **Audit logon events**.

> **Note:** Do not enable *both* Advanced and Legacy policies for the same category, as it can cause conflicts. **Advanced** is preferred for Server 2016+.
