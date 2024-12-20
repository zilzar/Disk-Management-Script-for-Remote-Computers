﻿Import-Module -Name Storage
# Remote Disk Management Script
$RemoteComputer = Read-Host "Enter the name or IP address of the remote computer"
$Cred = Get-Credential

Invoke-Command -ComputerName $RemoteComputer -Credential $Cred -ScriptBlock {
    # List Disk Information
    $Disks = Get-Disk | Where-Object { $_.OperationalStatus -eq "Online" }
    $Partitions = Get-Partition
    $Volumes = Get-Volume

    # Identify Unallocated Space
    Write-Output "`nDisk and Partition Information:"
    $UnallocatedDisks = @()  # Array to store disks with unallocated space
    $Disks | ForEach-Object {
        $DiskNumber = $_.Number
        $UnallocatedSpace = ($_.Size - $_.AllocatedSize) / 1GB
        
        # Print unallocated space in green or red
        if ($UnallocatedSpace -gt 0) {
            Write-Host "Disk $DiskNumber - Total Size: $($_.Size/1GB) GB | Extendable Free Space: $UnallocatedSpace GB" -ForegroundColor Green
            $UnallocatedDisks += $_  # Add disk with unallocated space to the list
        } else {
            Write-Host "Disk $DiskNumber - Total Size: $($_.Size/1GB) GB | Extendable Free Space: $UnallocatedSpace GB" -ForegroundColor Red
        }

        # List partitions on the disk
        Get-Partition -DiskNumber $DiskNumber | ForEach-Object {
            $DriveLetter = $_.DriveLetter
            $PartitionSize = $_.Size / 1GB
            Write-Output "  Partition: $DriveLetter | Size: $PartitionSize GB"
        }
    }

    # If there are disks with unallocated space, prompt the user to select one
    if ($UnallocatedDisks.Count -gt 0) {
        $Partitions | ForEach-Object {
            $DriveLetter = $_.DriveLetter
            $DiskNumber = $_.DiskNumber
            $SizeRemaining = $_.SizeRemaining / 1GB
            if ($SizeRemaining -gt 0) {
                Write-Output "DriveLetter: $DriveLetter (Disk $DiskNumber) | Extendable Free Space: $SizeRemaining GB"
            }
        }

        # Prompt the user to select a disk and drive
        Write-Host -NoNewline "Which drive would you like to extend? (Enter the DriveLetter, e.g., C " -ForegroundColor Yellow
        $SelectedDrive = Read-Host

        Write-Output "`nSelected Drive: $SelectedDrive"

        # Determine the maximum supported size and perform the extension
        $SupportedSize = Get-PartitionSupportedSize -DriveLetter $SelectedDrive
        Resize-Partition -DriveLetter $SelectedDrive -Size $SupportedSize.SizeMax
        Write-Output "`nDrive $SelectedDrive successfully extended!"
        Write-Host "Press Enter to exit." -ForegroundColor Green
    } else {
        Write-Host "`nNo disks available for extension." -ForegroundColor Red
    }

    Read-Host
}
