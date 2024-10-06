import 'package:flutter/material.dart';

import '../../utils/Colors.dart';
import '../../utils/default_sizes.dart';
import '../../utils/widgets/window_title_bar.dart';
import '../crashed_pc.dart';
import '../discover.dart';
import '../enhanced_video_recovery.dart';
import '../local_drive.dart';
import '../menu_pages/photo_repair.dart';
import '../menu_pages/removable_drive.dart';
import '../menu_pages/video_repair.dart';
import 'home.dart';
import 'menu_bar.dart'; // Assuming Menu is a custom widget for the left side menu.

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of widgets (screens) to display on the right side
  final List<Widget> _pages = [
    const Home(),
    const LocalDrive(),
    const RemovableDrive(),
    const CrashedPc(),
    const EnhancedVideoRecovery(),
    const PhotoRepair(),
    const VideoRepair(),
    const Discover(),
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex =
          index; // Update the selected index based on the menu click
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left side menu
        Container(
          width:
              screenWidth(context) / 4, // Fixed width for the left menu (25%)
          color: blueWhite,
          child: Column(
            children: [
              LeftWindowTitleBar(onPressed: () {
                _onMenuItemSelected(0);
              }),
              Expanded(
                child: Menu(
                  onItemSelected:
                      _onMenuItemSelected, // Pass the menu selection callback
                ),
              ),
            ],
          ),
        ),

        // Right side content (Multiple screens based on _selectedIndex)
        Expanded(
          child: Container(
            color: softBlueWhite,
            child: Column(
              children: [
                const RightWindowTitleBar(),
                Expanded(
                  child: _pages[_selectedIndex], // Display the selected screen
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
