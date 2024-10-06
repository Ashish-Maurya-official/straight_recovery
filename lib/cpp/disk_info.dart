import 'dart:ffi';

import 'package:ffi/ffi.dart';

const int MAX_PATH = 260;

base class DiskInfo extends Struct {
  @Array(4)
  external Array<Int8> driveLetter; // char driveLetter[4];

  @Array(12)
  external Array<Int8> diskType; // char diskType[12];

  @Array(MAX_PATH)
  external Array<Int8> volumeName; // char volumeName[MAX_PATH];

  @Array(MAX_PATH)
  external Array<Int8> fileSystem;

  @UnsignedLongLong()
  external int totalSize; // ULARGE_INTEGER totalSize;

  @UnsignedLongLong()
  external int usedSpace; // ULARGE_INTEGER usedSpace;

  @UnsignedLongLong()
  external int freeSpace; // ULARGE_INTEGER freeSpace;
}

// FFI function signature for the C function
typedef GetDiskInformationFunc = Pointer<DiskInfo> Function(
    Pointer<Int32> count);
typedef GetDiskInformation = Pointer<DiskInfo> Function(Pointer<Int32> count);

// Load the shared library
final DynamicLibrary lib = DynamicLibrary.open('lib/cpp/disk_info.dll');
final GetDiskInformation getDiskInformation =
    lib.lookupFunction<GetDiskInformationFunc, GetDiskInformation>(
        'getDiskInformation');

// Function to get disk information as a Dart Map
Map<String, Map<String, Map<String, dynamic>>> getDiskInfoAsMap() {
  final count = calloc<Int32>(); // Allocate memory for count
  final disksPointer = getDiskInformation(count); // Call the C function

  final int diskCount = count.value; // Get the number of disks
  calloc.free(count); // Free the count memory

  final Map<String, Map<String, Map<String, dynamic>>> disksMap =
      {}; // Hierarchical map

  for (int i = 0; i < diskCount; i++) {
    final disk = disksPointer.elementAt(i).ref;

    // Convert C char arrays to Dart strings
    final driveLetter = _convertToString(disk.driveLetter, 4); // Fixed size 4
    final diskType = _convertToString(disk.diskType, 12); // Fixed size 12
    final volumeName =
        _convertToString(disk.volumeName, MAX_PATH); // Fixed size 260
    final fileSystem = _convertToString(
        disk.fileSystem, MAX_PATH); // New field for file system

    // Store disk information in a hierarchical map
    if (!disksMap.containsKey(diskType)) {
      disksMap[diskType] =
          {}; // Initialize map for diskType if it doesn't exist
    }

    disksMap[diskType]![driveLetter] = {
      'volumeName': volumeName,
      'fileSystem': fileSystem, // Add file system information
      'totalSize': disk.totalSize,
      'usedSpace': disk.usedSpace,
      'freeSpace': disk.freeSpace,
    };
  }

  return disksMap;
}

// Helper function to convert C char array to Dart string
String _convertToString(Array<Int8> array, int size) {
  // Allocate memory for a Dart UTF8 string
  final Pointer<Int8> int8Pointer = calloc<Int8>(
      size + 1); // Allocate space for the string including null terminator

  for (int i = 0; i < size; i++) {
    int8Pointer.elementAt(i).value =
        array[i]; // Copy each element from the array
  }

  int8Pointer.elementAt(size).value = 0; // Null-terminate the string

  // Convert the Pointer<Int8> to a Pointer<Utf8>
  final Pointer<Utf8> utf8Pointer = int8Pointer.cast<Utf8>();

  // Convert to Dart String
  final String result = utf8Pointer.toDartString();

  // Free the allocated memory
  calloc.free(int8Pointer);

  return result;
}
