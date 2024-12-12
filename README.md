Disk Management Script for Remote Computers

This PowerShell script allows you to manage disks on remote computers by listing disk and partition details, identifying unallocated space, and providing an option to extend partitions with available unallocated space. It is particularly useful for system administrators managing multiple machines remotely.
Features:

    Remote Disk Management: The script runs remotely on a machine by using PowerShell remoting, allowing you to manage disks and partitions without physically accessing the machine.
    Disk and Partition Information: It retrieves and displays information about the disks, partitions, and volumes on the remote computer.
    Unallocated Space Detection: The script detects and highlights unallocated space on the disk, making it easier to spot areas for expansion.
    Interactive User Interface: After listing the available unallocated space, the user can select a drive to extend. The script handles resizing the selected partition to utilize the unallocated space.

How It Works:

    Credential Prompt: The script first prompts for user credentials to authenticate on the remote computer.
    Disk Information Retrieval: It then retrieves all disks that are online, as well as their partitions and volumes.
    Unallocated Space Detection: It checks for unallocated space on the disks. If available, the script will color-code the disks in green (for available unallocated space) or red (for no unallocated space).
    Partition Expansion: If unallocated space is found, the user is prompted to select a partition to extend. The script checks the maximum supported size for the selected partition and resizes it accordingly.
    Completion: After the partition is resized, a success message is displayed.

Usage:

    Clone or download the script from GitHub.
    Run the script in PowerShell as an administrator.
    Enter the remote computer's name or IP address when prompted.
    Enter the credentials for authentication.
    Follow the on-screen instructions to manage disks and partitions.

Prerequisites:

    PowerShell Remoting must be enabled on the remote machine.
    Administrator credentials are required to perform disk operations.
