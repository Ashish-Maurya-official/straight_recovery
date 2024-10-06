import 'package:flutter/cupertino.dart';

import '../utils/default_sizes.dart';
import '../utils/image_strings.dart';
import '../utils/text_string.dart';
import '../utils/widgets/description_text.dart';
import '../utils/widgets/heading.dart';
import '../utils/widgets/outlined_container.dart';

class EnhancedVideoRecovery extends StatefulWidget {
  const EnhancedVideoRecovery({super.key});

  @override
  State<EnhancedVideoRecovery> createState() => _EnhancedVideoRecoveryState();
}

class _EnhancedVideoRecoveryState extends State<EnhancedVideoRecovery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child:
                  SizedBox(width: 24, height: 24, child: Image.asset(toolLogo)),
            ),
            const Heading(
              text: enhanceVideoRecovery,
              size: bigHeadingSize,
              left: 10.0,
              top: 50.0,
            ),
          ],
        ),
        const DescriptionText(description: crashedPcDescription),
        const OutlinedContainer(
            child: Row(
          children: [],
        ))
      ],
    );
  }
}
