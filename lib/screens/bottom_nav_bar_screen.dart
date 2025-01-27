import 'package:flutter/material.dart';
import 'pre_call_page.dart';
import 'in_call_page.dart';
import 'post_call_page.dart';
import 'coaching_page.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0; // Default to Pre Call (index 0)

  final List<Widget> _pages = [
    PreCallPage(),
    InCallPage(),
    PostCallPage(),
    CoachingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_getAppBarTitle(),
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffc98b27),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pre Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'In Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.co_present),
            label: 'Coaching',
          ),
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0: return 'Pre-Call';
      case 1: return 'In Call';
      case 2: return 'Post Call';
      case 3: return 'Coaching';
      default: return 'Navigation';
    }
  }
}
