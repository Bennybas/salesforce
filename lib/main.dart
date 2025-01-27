import 'package:flutter/material.dart';
import 'screens/bottom_nav_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom NavBar Demo',
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white, // Override the default light pink background
      ),
      home: BottomNavBarScreen(),
    );
  }
}

