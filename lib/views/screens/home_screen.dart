import 'package:connectify/utilities/colors.dart';
import 'package:connectify/views/screens/history.dart';
import 'package:connectify/views/screens/meeting_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final pages = [
    MeetingScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Center(
          child: Text(
            'Meet and Chat',
            style: TextStyle(
              fontSize: 19,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.white,
        backgroundColor: footerColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: "Meet and Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Meeting",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
