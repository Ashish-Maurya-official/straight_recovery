import 'package:flutter/material.dart';

class LinearProgressInd extends StatelessWidget {
  final double value;
  const LinearProgressInd({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      color: Colors.blue,
      backgroundColor: Colors.grey,
      borderRadius: BorderRadius.circular(5.0),
    );
  }
}
