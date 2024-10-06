import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../default_sizes.dart';
import '../image_strings.dart';
import '../style.dart';

class RightWindowTitleBar extends StatelessWidget {
  const RightWindowTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MoveWindow(
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: const WindowButtons(),
          ),
        ],
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton(),
      ],
    );
  }
}

class LeftWindowTitleBar extends StatelessWidget {
  const LeftWindowTitleBar({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: menuButtonStyle.copyWith(
          overlayColor: WidgetStateProperty.all(Colors.transparent)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              top: 3,
            ),
            child: SizedBox(
              width: appLogoWidth,
              height: appLogoHeight,
              child: Image.asset(appLogo),
            ),
          ),
          const Expanded(
            child: Text(
              'Straight Recovery',
              style: appNameTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
