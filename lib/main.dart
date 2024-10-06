import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:straight_recovery/pages/homepage/home_page.dart';
import 'package:straight_recovery/provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiskInformationProvider()),
      ],
      child: const MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Main());
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePage());
  }
}
