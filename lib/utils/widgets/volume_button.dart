import 'package:flutter/material.dart';

import '../default_sizes.dart';
import '../image_strings.dart';
import '../style.dart';
import 'linear_progress_indicator.dart';

class VolumeButton extends StatelessWidget {
  final String? image;
  final String? name;
  final String? fileSystem;
  final String? diskLetter;
  final double totalSize;
  final double usedSpace;
  final VoidCallback onPressed;

  const VolumeButton(
      {super.key,
      this.image = driveLogo,
      required this.name,
      required this.fileSystem,
      required this.diskLetter,
      required this.totalSize,
      required this.usedSpace,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: volumeButtonWidth,
      height: volumeButtonHeight,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 20.0, right: 8.0),
        child: OutlinedButton(
          style: volumeButtonStyle,
          onPressed: () {
            onPressed();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: volumeLogoWidth,
                  height: volumeLogoHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Image.asset(image!),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                    child:Text(
                        "$name($diskLetter)",
                        style: volumeNameTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),),

                    SizedBox(
                      width: 180,
                      height: 8,
                      child: LinearProgressInd(value: usedSpace / totalSize),
                    ),
                    Stack(
                      children: [
                        Text(
                          '${(totalSize / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB/${(usedSpace / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB',
                          overflow: TextOverflow.ellipsis,
                          style: diskDataTextStyle,
                        ),
                        SizedBox(
                          width: 180,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              fileSystem!, overflow: TextOverflow.ellipsis,
                              // Dynamic file system type
                              style: diskDataTextStyle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
