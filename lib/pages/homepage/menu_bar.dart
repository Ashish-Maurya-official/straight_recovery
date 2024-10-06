import 'package:flutter/material.dart';

import '../../utils/default_sizes.dart';
import '../../utils/image_strings.dart';
import '../../utils/text_string.dart';
import '../../utils/widgets/heading.dart';
import '../../utils/widgets/menu_button.dart';
import '../../utils/widgets/spacing.dart';

class Menu extends StatelessWidget {
  final Function(int) onItemSelected; // Callback to handle menu selection

  const Menu({super.key, required this.onItemSelected});

  @override
  build(BuildContext context) {
    return ListView(
      children: [
        const Heading(
          text: lostDataRecovery,
          size: smallHeadingSize,
          left: headingToLeftSpace,
          top: windowTitleBarToContentSpace,
        ),
        const HeadingToButtonSpace(),
        MenuButton(
          image: driveLogo,
          name: localDrive,
          onPressed: () {
            onItemSelected(1); // Set this for Hard Drive screen
          },
        ),
        const ButtonToButtonSpace(),
        MenuButton(
          image: removableDiskLogo,
          name: removableDisk,
          onPressed: () {
            onItemSelected(2); // Set this for Removable Disk screen
          },
        ),
        const Heading(
          text: advanceRecovery,
          size: smallHeadingSize,
          left: headingToLeftSpace,
          top: buttonToHeadingSpace,
        ),
        const HeadingToButtonSpace(),
        MenuButton(
          image: corruptedPCLogo,
          name: crashedPC,
          onPressed: () {
            onItemSelected(3); // Set this for Crashed PC screen
          },
        ),
        const ButtonToButtonSpace(),
        MenuButton(
          image: toolLogo,
          name: enhanceVideoRecovery,
          onPressed: () {
            onItemSelected(4); // Set this for Enhanced Video Recovery screen
          },
        ),
        const Heading(
          text: corruptedFileRepair,
          size: smallHeadingSize,
          left: headingToLeftSpace,
          top: windowTitleBarToContentSpace,
        ),
        const HeadingToButtonSpace(),
        MenuButton(
          image: imageLogo,
          name: photoRepair,
          onPressed: () {
            onItemSelected(5); // Set this for Photo Repair screen
          },
        ),
        const ButtonToButtonSpace(),
        MenuButton(
          image: videoLogo,
          name: videoRepair,
          onPressed: () {
            onItemSelected(6); // Set this for Video Repair screen
          },
        ),
        const Heading(
          text: moreThanRecovery,
          size: smallHeadingSize,
          left: headingToLeftSpace,
          top: buttonToHeadingSpace,
        ),
        const HeadingToButtonSpace(),
        MenuButton(
          image: discoverLogo,
          name: discover,
          onPressed: () {
            onItemSelected(7); // Set this for Discover screen
          },
        ),
      ],
    );
  }
}
