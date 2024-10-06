import 'package:flutter/material.dart';

import 'Colors.dart';

final ButtonStyle menuButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 16.0), // Height of the button
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(1.0),
  ),
  alignment: Alignment.centerLeft, // Align text to the left
);

final ButtonStyle volumeButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.only(left: 10.0),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  shadowColor: Colors.blue,
  backgroundColor: blueWhite, // Background color
  foregroundColor: Colors.white, // Text color
  elevation: 2.0,
  surfaceTintColor: Colors.transparent, // Shadow depth
);

const TextStyle buttonTextStyle =
    TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400);

const TextStyle leftSideHeadingStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

const TextStyle rightSideHeadingTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25);

const TextStyle diskDataTextStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black);

const TextStyle driveNameTextStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: Colors.black, // Underline color
);

const TextStyle volumeNameTextStyle = TextStyle(
  fontSize: 17,
  color: Colors.black,
);
const TextStyle appNameTextStyle = TextStyle(
    fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500);
