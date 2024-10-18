**Article:** https://ahmetdoruk.medium.com/how-to-activate-windows-server-2019-2022-evaluation-1fbd73dd312e


### Windows Server Activation and Evaluation License Notes

When setting up a **Windows Server**, understanding the licensing and activation process is essential. This includes activation with `slmgr` (Software Licensing Management Tool) and extending the evaluation period if needed.

---

### 1. **Windows Server Evaluation License**

**Evaluation** versions of Windows Server are available for free for testing purposes. By default, these licenses are valid for **180 days** (6 months). After the evaluation period, certain features may become restricted, and the server might periodically restart or shut down.

- **Supported Editions for Evaluation**: Windows Server Standard, Datacenter, etc.
- **Limitations of Evaluation Versions**:
  - No official technical support.
  - Features may be limited after the trial period expires.

#### Checking the Evaluation Period

To check how many days are remaining in your evaluation period, use the following PowerShell command:

```bash
slmgr /dli
```

This will display details such as the time remaining on the license.

---

### 2. **Windows Server Activation Using `slmgr`**

To fully use Windows Server beyond the evaluation period, it must be activated with a valid product key. The **`slmgr`** tool is used to manage and activate licenses for Windows Server via command-line operations.

#### Activation Steps Using `slmgr`

1. **Enter Product Key**:

   To activate Windows Server using a product key, use the following command:

   ```bash
   slmgr /ipk <your-product-key>
   ```

   Example:

   ```bash
   slmgr /ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
   ```

2. **Activate Windows**:

   After entering the product key, activate the server online:

   ```bash
   slmgr /ato
   ```

   This command forces the system to contact Microsoft and activate the license.

3. **Check Activation Status**:

   You can verify if Windows Server is activated using:

   ```bash
   slmgr /dli
   ```

   or

   ```bash
   slmgr /xpr
   ```

   This will show if your system is permanently activated.

---

### 3. **Extending the Evaluation Period (Rearm)**

If you are using an evaluation version of Windows Server and need more time before activating it with a product key, you can **extend the evaluation period**. You are allowed to extend the trial period a total of **5 times**, with each extension giving you **180 additional days**.

#### How to Extend the Evaluation (Rearm)

1. **Check Remaining Rearms**:

   To see how many rearm attempts you have left, run the following command:

   ```bash
   slmgr /dlv
   ```

2. **Extend the Evaluation Period**:

   To extend the trial period by 180 days, use the **rearm** command:

   ```bash
   slmgr /rearm
   ```

   After running the command, restart your server for the changes to take effect. You can do this up to 5 times, giving you nearly **3 years** of evaluation time.

3. **Check New Expiration Date**:

   After the rearm, use:

   ```bash
   slmgr /xpr
   ```

   This will show the new expiration date after the extension.

---

### 4. **Troubleshooting Activation Issues**

- **KMS (Key Management Service) Activation**: In some environments, a **KMS server** is used to activate multiple Windows Server installations. In that case, the KMS client setup key can be used:

  ```bash
  slmgr /ipk <KMS-client-key>
  slmgr /ato
  ```

- **Manual Activation (Phone)**: If online activation fails, you can activate Windows Server via phone by using the following command:

  ```bash
  slmgr /dti
  ```

  This will display an installation ID that you can provide to Microsoft during the phone activation process.

---

### 5. **Key Commands for `slmgr`**

- **/ipk**: Install a product key.
- **/ato**: Activate Windows online.
- **/rearm**: Extend the evaluation period (only available in trial versions).
- **/dli**: Display license information.
- **/dlv**: Display more detailed licensing information.
- **/xpr**: Display the expiration date of the current license.

---

### 6. **Additional Licensing Information**

- **Retail Keys**: These are individual product keys that can activate a single instance of Windows Server.
- **OEM Keys**: Original Equipment Manufacturer (OEM) keys come pre-installed on devices from the manufacturer.
- **Volume Licensing**: For organizations, volume licensing keys are used to activate multiple instances of Windows Server.

---

By using these commands and tools, you can efficiently manage the activation, evaluation, and rearm process for Windows Server, ensuring compliance and uninterrupted functionality.
