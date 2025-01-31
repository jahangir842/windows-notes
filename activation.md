## Activation Methods

### Activate with IRM

Open Powershell as Administrator and run the following command to lauch the activate process:

```BASH
irm https://massgrave.dev/get | iex
```
Blog: [activate-windows-with-one-command:](https://medium.com/@alexads108/activate-windows-with-one-command-no-need-to-look-for-the-activation-tool-activation-code-anymore-b73b5c1fd8d5)

---

### Finding Windows 10 Activation Key

#### 1. **Using Command Prompt:**
- **Open Command Prompt:**
  - Press **Windows + X**.
  - Select **Command Prompt (Admin)** or **Windows PowerShell (Admin)**.
- **Enter Command:**
  ```shell
  wmic path softwarelicensingservice get OA3xOriginalProductKey
  ```
- **Result:** Activation key displayed on the screen.

---

#### 2. **Using Settings:**
- **Check Activation Status:**
  - Go to **Settings** > **Update & Security** > **Activation**.
  - If activated, the key won't be shown here.

---

#### 3. **Registry (Advanced Users):**
- **Open Registry Editor:**
  - Press **Windows + R**, type `regedit`, and press **Enter**.
- **Navigate to:**
  ```
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion
  ```
- **Look for:** **ProductId** (doesn’t show actual key).

---

#### 4. **Third-Party Software:**
- Use tools like **Belarc Advisor** or **ProduKey** to retrieve the activation key.

---

#### 5. **Physical Documentation:**
- Check packaging for the activation key if you purchased a physical copy.

---

### Checking Windows 10 Activation Validity

#### 1. **Using Settings:**
- **Open Settings:**
  - Press **Windows + I**.
- **Go to:**
  - **Update & Security** > **Activation**.
- **Check Status:** Should say "Windows is activated."

---

#### 2. **Using Command Prompt:**
- **Open Command Prompt:**
  - Press **Windows + X** and select **Command Prompt (Admin)**.
- **Enter Command:**
  ```shell
  slmgr.vbs /xpr
  ```
- **Result:** Pop-up shows activation status.

---

#### 3. **Activation Troubleshooter:**
- **Open Settings:**
  - Press **Windows + I**.
- **Navigate to:**
  - **Update & Security** > **Activation**.
- **Run Troubleshooter:** Click if available to fix issues.

---

#### 4. **Check Product Key Validity:**
- Test key validity on Microsoft Store or through the "Change product key" option.

---

#### 5. **Contact Microsoft Support:**
- For assistance with activation issues or key problems.

---

### Resolving "Notification Mode"

- **Definition:** Indicates Windows is not activated; limited features available.

#### Steps to Resolve:
1. **Check Internet Connection:** Ensure active connection for validation.
2. **Activate Windows:**
   - Go to **Settings** > **Update & Security** > **Activation**.
   - Click **Change product key** and enter a valid key.
3. **Run Activation Troubleshooter:** Use the option in Activation settings.
4. **Verify Product Key:** Ensure it’s valid and matches your Windows version.
5. **Contact Microsoft Support:** For unresolved issues.
6. **Reinstall Windows:** As a last resort with valid key.

---

### Activation Without Internet

- **Note:** Internet is typically required for key activation.

#### Alternatives:
- **Phone Activation:**
  - Call Microsoft support for activation using your key.

#### Phone Activation Steps:
1. **Open Activation Settings:**
   - Press **Windows + I** > **Update & Security** > **Activation**.
2. **Select "Activate by Phone":** (if available).
3. **Follow Prompts:** Get the activation ID.
4. **Call the Number:** Provided in the activation window.
5. **Provide Installation ID:** A series of numbers displayed.
6. **Enter Confirmation ID:** Given by the automated system.
7. **Complete Activation:** Enter it back in the activation window.

---

### Important:
- Always use genuine versions of Windows to avoid activation issues.

---
