import 'package:flutter/material.dart';

import '../default_sizes.dart';
import '../style.dart';

class MenuButton extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onPressed;

  const MenuButton(
      {super.key,
      required this.image,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: menuButtonStyle,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: buttonToLeftSpace),
                child: Image.asset(
                  image,
                  width: menuButtonLogoWidth,
                  height: menuButtonLogoHeight,
                ),
              ),
              Expanded(
                child: Text(
                  '   $name',
                  style: buttonTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
