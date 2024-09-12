# **Overview of `adprep.exe`**

**1. **Purpose:**
`adprep.exe` is used to perform necessary updates to the AD schema and domain infrastructure to support new Windows Server versions. This tool ensures that the Active Directory environment is compatible with the new server software.

**2. **When to Use:**
- **Before Installing**: When you are installing a new domain controller with a newer version of Windows Server into an existing domain or forest.
- **Upgrading**: Prior to upgrading the operating system of existing domain controllers to a newer version of Windows Server.

**3. **Components:**
`adprep.exe` includes several commands to perform different types of preparation tasks:
- **Forest Preparation**: Updates the AD schema and forest-wide configurations.
- **Domain Preparation**: Updates domain-wide configurations.

### **Usage**

**1. **Running `adprep.exe`:**

- **Forest Preparation**:
  ```cmd
  adprep /forestprep
  ```

  - **Purpose**: Updates the AD schema and prepares the forest for the new server version.
  - **Requirements**: Run this command on the Schema Master role holder.

- **Domain Preparation**:
  ```cmd
  adprep /domainprep
  ```

  - **Purpose**: Updates the domain's infrastructure to support the new server version.
  - **Requirements**: Run this command on the Infrastructure Master role holder in each domain.

- **Additional Commands**:
  - **`adprep /domainprep /gpprep`**: Prepares the domain for Group Policy updates.
  - **`adprep /rodcprep`**: Prepares the domain for the installation of Read-Only Domain Controllers (RODCs).

**2. **Steps to Use `adprep.exe`:**

1. **Log in**: Use an account with appropriate administrative privileges, typically a member of the Enterprise Admins group.

2. **Locate the Tool**: Find `adprep.exe` on the installation media of the new Windows Server version, usually located in the `\sources\adprep` directory.

3. **Run Commands**: Execute the necessary `adprep` commands from the Command Prompt.

4. **Verify**: Check for any errors and ensure that the commands complete successfully.

**3. **Common Issues:**

- **Insufficient Permissions**: Ensure you have the necessary permissions to run `adprep.exe`.
- **Schema Version**: Verify that the AD schema is correctly updated after running `adprep /forestprep`.

**4. **Best Practices:**

- **Backup**: Always back up your AD environment before running `adprep.exe`.
- **Plan**: Ensure you have a plan and understand the impact of the changes before proceeding.
- **Verify**: Check that all domain controllers are functioning correctly after running the commands.

### **Summary**

`adprep.exe` is a crucial tool for preparing Active Directory environments for upgrades or new installations of Windows Server. It updates the schema and domain configurations to ensure compatibility with the new server version. Proper usage and preparation are essential to avoid issues during the upgrade process.
