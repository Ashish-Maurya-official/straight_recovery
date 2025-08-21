import 'dart:ffi';
import 'dart:isolate';
import 'package:ffi/ffi.dart';

// Update to the path/name of your DLL (must be present near your .exe or specify full path)
final DynamicLibrary jpgRecovererLib = DynamicLibrary.open('lib/cpp/recoverJPG.dll');

// Native function signature in C++
typedef RecoverJPGsNative = Int32 Function(Pointer<Utf8> diskPath, Pointer<Utf8> outputDir);
// Dart wrapper signature
typedef RecoverJPGs = int Function(Pointer<Utf8> diskPath, Pointer<Utf8> outputDir);

// Look up the function in the DLL
final RecoverJPGs recoverJPGs = jpgRecovererLib
    .lookup<NativeFunction<RecoverJPGsNative>>('RecoverJPGs')
    .asFunction();

/// Call this function from your Flutter button click, passing disk path and output directory.
void runRecovery(String diskPath, String outputDir) {
  final diskPathPtr = diskPath.toNativeUtf8();
  final outputDirPtr = outputDir.toNativeUtf8();
  try {
    final int result = recoverJPGs(diskPathPtr, outputDirPtr);
    if (result == 0) {
      print("Recovery completed successfully.");
    } else {
      print("Recovery failed. Check if the path is valid and try running as administrator.");
    }
  } catch (e) {
    print("Error calling DLL: $e");
  } finally {
    malloc.free(diskPathPtr);
    malloc.free(outputDirPtr);
  }
}
