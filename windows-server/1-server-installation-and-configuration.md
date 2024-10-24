### **Installing Windows Server**

### **Download Windows Server ISO**:
   - Download the latest Windows Server ISO from Microsoft (either the **evaluation version** or the **full version** if you have a license).

### **Select Installation Type**:
   - **Server with Desktop Experience**: Includes a GUI (Graphical User Interface).
   - **Server Core**: Minimal installation without GUI for a smaller footprint and reduced attack surface. 

---

### **Basic Configuration**

### **Set a Static IP Address**

By default, Windows Server gets an IP via DHCP. For most server roles, you’ll want to assign a **static IP**.

---

#### 2.2 **Configure Windows Firewall**

By default, **Windows Defender Firewall** is enabled to secure your server. You can configure firewall rules to allow or block traffic based on your requirements.

1. **Access Windows Firewall**:
   - Open the Server Manager, go to `Local Server`, and check the `Firewall` settings.
   - Alternatively, go to **Control Panel > System and Security > Windows Defender Firewall**.

2. **Create Inbound/Outbound Rules**:
   - To open a specific port (e.g., for web servers or databases), follow these steps:
   - Open **Windows Defender Firewall with Advanced Security**.
   - In the left pane, click `Inbound Rules`.
   - Click `New Rule...`, then select `Port`.
   - Enter the port number (e.g., **80** for HTTP, **443** for HTTPS), then allow or block the connection.

3. **Enable/Disable Firewall**:
   - You can disable the firewall (not recommended in production environments):
   - In Command Prompt, use:
     ```bash
     netsh advfirewall set allprofiles state off
     ```

   - To re-enable it:
     ```bash
     netsh advfirewall set allprofiles state on
     ```

---

### **Disabling Internet Explorer Enhanced Security Configuration (IE ESC)**

**Internet Explorer Enhanced Security Configuration (IE ESC)** is a security feature in Windows Server that restricts browsing to untrusted websites. While useful in locking down the server, it can also make accessing web applications and downloading files more difficult during configuration or administration.

#### Reasons to Disable IE ESC:

- **Ease of Administration**: IE ESC limits browsing and can block access to web resources, making it difficult to download tools, updates, or browse documentation.
- **Third-Party Tools**: Some server management applications might require web access for setup, and IE ESC can hinder this.

> **Note**: It’s recommended to enable IE ESC after initial configuration if you plan to access the server over the web.

#### How to Disable IE ESC:

1. **Open Server Manager**:
   - In Server Manager, go to `Local Server`.

2. **Locate IE Enhanced Security Configuration**:
   - You will see an option labeled **IE Enhanced Security Configuration**.
   - Click on it, and a pop-up will appear.

3. **Turn Off IE ESC**:
   - You can choose to turn off IE ESC for both **Administrators** and **Users**.
   - After disabling, you can access websites without the restrictions.

---

### 4. **Other Basic Server Settings**

#### 4.1 **Changing Server Name**

- In Server Manager, under `Local Server`, click the computer name next to `Computer Name`.
- Click `Change` to rename the server.
- After changing the name, you’ll be prompted to restart the server.

#### 4.2 **Windows Updates**

Ensure that your server has the latest updates by going to:

- `Server Manager > Local Server > Windows Update`.
- Click `Check for updates` and install any available updates.

#### 4.3 **Domain Joining**

To join a **Windows Domain**:
1. Go to `Local Server > Computer Name > Domain`.
2. Click `Change`, and in the `Member of` section, select **Domain** and enter your domain name.
3. Provide credentials for the domain and restart the server.

---

### Summary

- **Windows Server Installation**: Follow standard installation steps using an ISO. 
- **Static IP**: Configure the network for a static IP to ensure the server has a consistent address.
- **Windows Firewall**: Customize firewall rules to open necessary ports for your server roles.
- **IE Enhanced Security**: Disabling IE ESC temporarily can ease initial configuration but should be re-enabled for security in production.
- **Post-Installation Tasks**: Rename the server, apply updates, and join it to a domain as needed.

By following these steps, you will have a Windows Server set up and configured for basic network and security needs.
