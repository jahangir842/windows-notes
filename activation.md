To find the activation key for Windows 10, you can use one of the following methods:

### 1. **Using Command Prompt:**
1. Press **Windows + X** and select **Command Prompt (Admin)** or **Windows PowerShell (Admin)**.
2. Type the following command and press **Enter**:
   ```shell
   wmic path softwarelicensingservice get OA3xOriginalProductKey
   ```
3. The activation key should appear on the screen.

### 2. **Using Settings:**
- If Windows 10 is already activated, you won't see the key, but you can confirm activation status:
1. Go to **Settings** > **Update & Security** > **Activation**.
2. Check the activation status; if it's activated, you won't see the key here.

### 3. **Check Registry (Advanced Users):**
1. Press **Windows + R**, type `regedit`, and press **Enter**.
2. Navigate to:
   ```
   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion
   ```
3. Look for a value named **ProductId**. However, this won't show the actual key directly; it's more complex.

### 4. **Third-Party Software:**
There are third-party applications like **Belarc Advisor** or **ProduKey** that can retrieve your Windows activation key.

### 5. **Physical Documentation:**
If you purchased a physical copy of Windows, check the packaging for the key.

### Note:
Always ensure you have permission to view or share software keys, as they are typically tied to specific licenses.
