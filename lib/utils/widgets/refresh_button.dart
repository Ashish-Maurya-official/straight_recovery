import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {
            Provider.of<DiskInformationProvider>(context, listen: false)
                .fetchDiskInfo();
          },
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
          child: const Text('Refresh',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue)),
        ),
      ),
    );
  }
}
