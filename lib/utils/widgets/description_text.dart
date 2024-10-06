import 'package:flutter/cupertino.dart';

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 20, top: 5),
      child: Text(
        description,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
