import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/common_location_map.dart';
import '../../utils/default_sizes.dart';
import '../../utils/text_string.dart';
import '../../utils/widgets/common_location_button.dart';
import '../../utils/widgets/description_text.dart';
import '../../utils/widgets/heading.dart';
import '../../utils/widgets/refresh_button.dart';
import '../../utils/widgets/volume_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView(children: [
        // Refresh Button on the right
        const RefreshButton(),
        // Main heading
        const Heading(
          text: hardDrive,
          size: bigHeadingSize,
          left: 30,
        ),
        // Description
        const DescriptionText(description: driveDescription),
        // Disk Information (non-scrollable)
        Consumer<DiskInformationProvider>(
          builder: (context, diskInfoProvider, child) {
            final diskInfoMap = diskInfoProvider.disks;
            return Column(
              children: diskInfoMap.entries.map((diskType) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Disk type row (Local or External)
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 5, top: 10, bottom: 2),
                          child: Icon(
                            diskType.key == 'Local'
                                ? Icons.computer // Icon for Local Drives
                                : Icons.usb, // Icon for External Drives
                            color: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Heading(
                            text:
                                '${diskType.key} Drive (${diskType.value.length})',
                            size: smallHeadingSize,
                          ),
                        ),
                      ],
                    ),
                    // Partitions of each disk (horizontal scroll)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: diskType.value.entries.map((partition) {
                          return VolumeButton(
                            name: partition.value['volumeName'].toString(),
                            fileSystem:
                                partition.value['fileSystem'].toString(),
                            diskLetter: partition.key,
                            totalSize: partition.value['totalSize'].toDouble(),
                            usedSpace: partition.value['usedSpace'].toDouble(),
                            onPressed: () {},
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ),
        // Common Locations Heading
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 5, top: 10, bottom: 2),
              child: Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Heading(
                text: commonLocations,
                size: smallHeadingSize,
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: commonLocationMap.entries.map((location) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CommonLocationButton(
                  name: location.key,
                  image: location.value,
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
