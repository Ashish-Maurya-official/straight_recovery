import 'package:flutter/material.dart';

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
