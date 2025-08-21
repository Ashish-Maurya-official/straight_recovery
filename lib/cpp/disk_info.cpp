#include <windows.h>
#include <string.h> // For strncpy

// Maximum path length for volume name
#define MAX_PATH_LENGTH 260
#define MAX_DISK_COUNT 26 // Maximum number of drives (A-Z)

// DiskInfo structure definition
extern "C" struct DiskInfo {
    char driveLetter[4];
    char diskType[12];
    char volumeName[MAX_PATH_LENGTH];
    char fileSystem[MAX_PATH_LENGTH];
    ULARGE_INTEGER totalSize;
    ULARGE_INTEGER usedSpace;
    ULARGE_INTEGER freeSpace;
};

// C function to get disk information
extern "C" __declspec(dllexport) DiskInfo* getDiskInformation(int* count) {
    static DiskInfo disks[MAX_DISK_COUNT]; // Static array to hold disk information
    int diskCount = 0; // Counter for the number of disks

    char drive[4] = "A:\\"; // Template for drive letters
    for (char letter = 'A'; letter <= 'Z'; ++letter) {
        drive[0] = letter; // Set the drive letter
        UINT type = GetDriveTypeA(drive); // Get the drive type
        if (type == DRIVE_FIXED || type == DRIVE_REMOVABLE) {
            DiskInfo diskInfo = {}; // Create a new DiskInfo instance
            strncpy(diskInfo.driveLetter, drive, sizeof(diskInfo.driveLetter) - 1);
            diskInfo.driveLetter[sizeof(diskInfo.driveLetter) - 1] = '\0'; // Null-terminate

            strncpy(diskInfo.diskType, (type == DRIVE_REMOVABLE) ? "Removable" : "Local", sizeof(diskInfo.diskType) - 1);
            diskInfo.diskType[sizeof(diskInfo.diskType) - 1] = '\0'; // Null-terminate

            DWORD serialNumber, maxComponentLen, fileSystemFlags;
            char volumeName[MAX_PATH_LENGTH] = "";
            char fileSystemName[MAX_PATH_LENGTH] = ""; // Add a buffer for the file system name

            if (GetVolumeInformationA(drive, volumeName, sizeof(volumeName), &serialNumber,
                                      &maxComponentLen, &fileSystemFlags, fileSystemName, sizeof(fileSystemName))) {
                strncpy(diskInfo.volumeName, volumeName, sizeof(diskInfo.volumeName) - 1);
                diskInfo.volumeName[sizeof(diskInfo.volumeName) - 1] = '\0'; // Null-terminate

                strncpy(diskInfo.fileSystem, fileSystemName, sizeof(diskInfo.fileSystem) - 1); // Copy the file system name
                diskInfo.fileSystem[sizeof(diskInfo.fileSystem) - 1] = '\0'; // Null-terminate

                ULARGE_INTEGER freeBytes, totalBytes, totalFreeBytes;
                if (GetDiskFreeSpaceExA(drive, &freeBytes, &totalBytes, &totalFreeBytes)) {
                    diskInfo.totalSize = totalBytes;
                    diskInfo.freeSpace = freeBytes;
                    diskInfo.usedSpace.QuadPart = totalBytes.QuadPart - freeBytes.QuadPart;

                    disks[diskCount] = diskInfo; // Store diskInfo in the array
                    diskCount++; // Increment the disk count

                    if (diskCount >= MAX_DISK_COUNT) {
                        break; // Stop if we reach the maximum number of disks
                    }
                }
            }
        }
    }

    *count = diskCount; // Return the count of disks
    return disks; // Return pointer to the static array
}
