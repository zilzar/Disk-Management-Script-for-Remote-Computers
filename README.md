# Disk Management Script for Remote Computers
# Disk Extend for Remote Computers

![](https://i.imgur.com/TxQKDFK.png 'Sample')

⚡ This PowerShell script allows you to manage disks on remote computers by listing disk and partition details, identifying unallocated space, and providing an option to extend partitions with available unallocated space.

It is **especially designed to facilitate disk management tasks for Virtual Machines (VMs) or other remote systems without requiring Remote Desktop Protocol (RDP) access.** This makes it an invaluable tool for system administrators managing multiple machines remotely and efficiently.

## Features:

### Remote Disk Management: 

1. **Remote Disk Management:**

    - The script runs remotely on a machine by using PowerShell remoting, allowing you to manage disks and partitions without physically accessing the machine.

2. **Disk and Partition Information:**

    - It retrieves and displays information about the disks, partitions, and volumes on the remote computer.

3. **Unallocated Space Detection:**

    - The script detects and highlights unallocated space on the disk, making it easier to spot areas for expansion.

4. **Interactive User Interface:**
    - After listing the available unallocated space, the user can select a drive to extend. The script handles resizing the selected partition to utilize the unallocated space.

## How It Works:

1. **Credential Prompt:**

    - The script first prompts for user credentials to authenticate on the remote computer.

2. **Disk Information Retrieval:**

    - It then retrieves all disks that are online, as well as their partitions and volumes.

3. **Unallocated Space Detection:**
    - It checks for unallocated space on the disks. If available, the script will color-code the disks in green (for available unallocated space) or red (for no unallocated space).

4. **Partition Expansion:**
    - If unallocated space is found, the user is prompted to select a partition to extend. The script checks the maximum supported size for the selected partition and resizes it accordingly.

5. **Completion:**
    - After the partition is resized, a success message is displayed.

## Usage:

1. **Clone or download the script from GitHub.**
2. **Run the script in PowerShell as an administrator..**
3. **Enter the remote computer's name or IP address when prompted..**
4. **Enter the credentials for authentication..**
5. **Follow the on-screen instructions to manage disks and partitions..**

## Prerequisites:

1. **PowerShell Remoting must be enabled on the remote machine.**
2. **Administrator credentials are required to perform disk operations.**
