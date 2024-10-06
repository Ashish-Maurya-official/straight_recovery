import 'package:flutter/material.dart';

import '../default_sizes.dart';
import '../style.dart';

class CommonLocationButton extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback? callback;

  const CommonLocationButton(
      {super.key, required this.image, required this.name, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: volumeButtonWidth,
      height: volumeButtonHeight,
      margin: const EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 20.0, right: 8.0),
        child: OutlinedButton(
          style: volumeButtonStyle,
          onPressed: () {
            callback!();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: volumeLogoWidth,
                  height: volumeLogoHeight,
                  child: Image.asset(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: volumeNameTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
