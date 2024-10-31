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


---

To check the validity of your Windows 10 activation, follow these steps:

### 1. **Using Settings:**
1. **Open Settings**: Press **Windows + I**.
2. **Go to Update & Security**: Click on **Update & Security**.
3. **Select Activation**: On the left sidebar, click **Activation**.
4. **Check Activation Status**: Here, you'll see if Windows is activated. It should say "Windows is activated" if it's valid.

### 2. **Using Command Prompt:**
1. **Open Command Prompt**: Press **Windows + X** and select **Command Prompt (Admin)** or **Windows PowerShell (Admin)**.
2. **Type the Command**: Enter the following command and press **Enter**:
   ```shell
   slmgr.vbs /xpr
   ```
3. **View the Result**: A pop-up will display whether your Windows is permanently activated or the expiration date if it's a trial.

### 3. **Using Activation Troubleshooter:**
1. **Go to Settings**: Press **Windows + I**.
2. **Select Update & Security** > **Activation**.
3. **Run Troubleshooter**: If you see an option to troubleshoot, click it to identify any issues with your activation.

### 4. **Check Product Key Validity:**
If you want to verify that the product key itself is valid:
- You can try entering it on the Microsoft Store or using a tool like Microsoft's "Change product key" option in the Activation settings to see if it accepts the key.

### 5. **Contact Microsoft Support:**
If you suspect any issues with your activation or key, contacting Microsoft Support can provide clarity and assistance.

### Note:
Always ensure that you're using genuine copies of Windows to avoid any activation issues.

---

If Windows says it's in "notification mode," it means that your copy of Windows is not activated. In this mode, you'll receive notifications about activation status and some personalization features may be limited.

### Steps to Resolve This:

1. **Check Internet Connection**: Ensure you have an active internet connection, as Windows may need to connect to validate your activation.

2. **Activate Windows**:
   - Go to **Settings** > **Update & Security** > **Activation**.
   - Click on **Change product key** and enter your valid product key.
   - Follow the prompts to activate.

3. **Run Activation Troubleshooter**:
   - In the Activation settings, you may see a **Troubleshoot** option. Click it to diagnose and potentially fix activation issues.

4. **Verify Your Product Key**:
   - Ensure that the product key you’re using is valid and corresponds to the correct version of Windows 10.

5. **Contact Microsoft Support**: If you're unable to activate Windows using your product key or if you encounter any errors, reaching out to Microsoft Support may help resolve the issue.

6. **Reinstall Windows**: As a last resort, if you have a valid product key but are still having issues, consider reinstalling Windows and attempting activation again.

### Important:
Make sure you are using a genuine and valid version of Windows to avoid ongoing issues with activation.


---

Yes, you typically need an internet connection to activate Windows 10 using a product key. The activation process checks with Microsoft's servers to validate the key and confirm that it hasn’t been used on another device.

### Alternatives:
- **Phone Activation**: If you don’t have internet access, you can use the phone activation method. This usually involves calling a Microsoft support number and following the automated prompts to activate using your key.

### Steps for Phone Activation:
1. Go to **Settings** > **Update & Security** > **Activation**.
2. Click on **Activate by Phone** (if available).
3. Follow the prompts to get the activation ID and enter it during the call.

Having an internet connection is the simplest and quickest method, though!

