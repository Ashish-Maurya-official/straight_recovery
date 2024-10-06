import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/default_sizes.dart';
import '../utils/text_string.dart';
import '../utils/widgets/heading.dart';
import '../utils/widgets/volume_button.dart';

class LocalDrive extends StatefulWidget {
  const LocalDrive({super.key});

  @override
  State<LocalDrive> createState() => _LocalDriveState();
}

class _LocalDriveState extends State<LocalDrive> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DiskInformationProvider>(
      builder: (context, diskInfoProvider, child) {
        var diskInfoMap = diskInfoProvider.disks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: diskInfoMap.entries.map((diskType) {
            if (diskType.key.contains('Local')) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading and description remain static (non-scrollable)
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 10.0, top: 8.0),
                          child: Icon(
                            Icons.computer,
                            color: Colors.blue,
                          ),
                        ),
                        Heading(
                          text: '$localDrive (${diskType.value.length})',
                          size: bigHeadingSize,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, bottom: 20, top: 5),
                    child: Text(
                      driveDescription,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Scrollable VolumeButtons
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // Scroll horizontally
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: diskType.value.entries.map((partition) {
                        return VolumeButton(
                          name: partition.value['volumeName'].toString(),
                          fileSystem: partition.value['fileSystem'].toString(),
                          diskLetter: partition.key,
                          totalSize: partition.value['totalSize'].toDouble(),
                          usedSpace: partition.value['usedSpace'].toDouble(),
                          onPressed: () {
                            // Add functionality here if needed
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else if (diskType.key.contains('Local') == 0) {
              return const Center(
                child: Text('Empty'),
              );
            } else
              return Container();
          }).toList(),
        );
      },
    );
  }
}
