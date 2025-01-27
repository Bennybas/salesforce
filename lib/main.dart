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
      title: 'Sales-Force App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          // Restrict the app width and height to simulate a mobile screen size
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400,  // Mobile screen width
                maxHeight: 800, // Mobile screen height
              ),
              child: AspectRatio(
                aspectRatio: 400 / 800, // Ensure the aspect ratio is correct
                child: BottomNavBarScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
