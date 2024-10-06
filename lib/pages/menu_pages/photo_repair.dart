import 'package:flutter/cupertino.dart';

import '../../utils/default_sizes.dart';
import '../../utils/image_strings.dart';
import '../../utils/text_string.dart';
import '../../utils/widgets/description_text.dart';
import '../../utils/widgets/heading.dart';
import '../../utils/widgets/outlined_container.dart';

class PhotoRepair extends StatefulWidget {
  const PhotoRepair({super.key});

  @override
  State<PhotoRepair> createState() => _PhotoRepairState();
}

class _PhotoRepairState extends State<PhotoRepair> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: SizedBox(
                  width: 24, height: 24, child: Image.asset(imageLogo)),
            ),
            const Heading(
              text: photoRepair,
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
