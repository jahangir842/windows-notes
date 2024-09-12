## DHCP Relay

A DHCP relay agent works as an intermediary between DHCP clients and DHCP servers that aren't on the same subnet or local network. The DHCP Relay Agent forwards DHCP broadcast messages from clients to a remote server, letting clients obtain IP addresses and other network configuration information from a DHCP server located on a different subnet.

To install the DHCP relay agent on Windows Server, you need to deploy the Remote Access server role. The DHCP relay agent is a feature of Remote Access and isn't included in the DHCP server role.

## Prerequisites

Before you can install your DHCP relay agent, you must have the following prerequisites:

A computer running Windows Server in the remote subnet where you want to install the DHCP relay agent.
A DHCP server with a DHCP scope configured for the remote subnet.

## Install and Configure the Server Role

To install and configure LAN routing as part of the Remote Access server role from a Windows desktop, follow these steps:

1. Sign in to the computer where you want to install the DHCP relay agent, then open **Server Manager**.

2. In the **Server Manager** console, click **Add roles and features**.

3. In the **Add Roles and Features Wizard**, click **Next** until you reach the **Server Roles** page.

4. Expand the **Remote Access** role by selecting the checkbox or arrow next to it.

5. Under **Role Services**, check the box for **Routing**, then click **Add Features** when prompted.

6. Click **Next** until you reach the **Confirm installation selections** page.

7. Click **Install** to start the installation. After the installation completes, click **Open the Getting Started Wizard**.

8. In the **Routing and Remote Access** Microsoft Management Console (MMC), right-click the server and select **Configure and Enable Routing and Remote Access** to launch the Routing and Remote Access Server Setup Wizard.

9. In the Routing and Remote Access Server Setup Wizard, click **Next** on the welcome screen.

10. For **Configuration**, select **LAN routing**, then click **Next**.

11. Under **Custom Configuration**, choose **VPN access**, then click **Next** to proceed to the **Completing the Routing and Remote Access Server Setup Wizard**.

12. Click **Finish** to close the wizard, and then select **Start service** when prompted.

## Configure DHCP Relay Agent

To install and configure the DHCP Relay Agent role from the Routing and Remote Access MMC, follow these steps:

1. In the left pane, expand the server name, then right-click **General** under **IPv4** or **IPv6**, and select **New Routing Protocol**.

2. In the left pane, right-click **DHCP Relay Agent** under **IPv4** or **IPv6**, then select **New Interface**.

3. Choose the network interface you want to use for the DHCP relay agent, then click **OK**.

4. In the left pane, right-click **DHCP Relay Agent** under **IPv4** or **IPv6**, and select **Properties**.

5. Enter the IP address of the DHCP server you want to relay DHCP requests to, then click **Add**.

6. Click **OK** to save your settings.

The DHCP Relay Agent is now installed and configured on your Windows Server.
