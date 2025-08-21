import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:straight_recovery/cpp/recoverJPG.dart';

import '../cpp/disk_info.dart';

class DiskInformationProvider extends ChangeNotifier {
  Map<String, Map<String, Map<String, dynamic>>> disks = {};

  DiskInformationProvider() {
    fetchDiskInfo();
  }

  // Fetch disk information and notify listeners
  void fetchDiskInfo() {
    disks = getDiskInfoAsMap();
    notifyListeners();
  }
}

void startRecovery(List <dynamic> args){
  final sendPort = args[0] as SendPort;
  final number = args[1] as String;
  final text = args[2] as String;
  runRecovery(args[1], args[2]);
  sendPort.send(true);
}