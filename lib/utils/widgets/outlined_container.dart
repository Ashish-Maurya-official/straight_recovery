import 'package:flutter/material.dart';

class OutlinedContainer extends StatelessWidget {
  final Widget child;
  const OutlinedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 7,
              // offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5), // Rounded corners
          color: Colors.white,
        ),
        child: child,
      ),
    ));
  }
}
