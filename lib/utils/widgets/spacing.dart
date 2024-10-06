import 'package:flutter/cupertino.dart';

class HeadingToButtonSpace extends StatelessWidget {
  const HeadingToButtonSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}

class ButtonToButtonSpace extends StatelessWidget {
  const ButtonToButtonSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 5,
    );
  }
}
