import 'package:flutter/material.dart';
import 'package:news_app/Screens/following/following_screen.dart';
import 'package:news_app/Screens/headline/headline_screen.dart';
import 'package:news_app/Screens/home_screen.dart';
import 'package:news_app/Screens/newsstand/newsstand_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stars_rounded,
              color: Colors.black,
            ),
            label: "For you",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Headlines"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: "Following"),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_headline_rounded), label: "Newsstand"),
        ],
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.grey,
        // Color for the selected item
        unselectedItemColor: Colors.black,
        // Color for the unselected items
        onTap: _onItemTapped,
      ),
    );
  }

  Widget getBody() {
    if (_selectedIndex == 0) {
      return const HomeScreen();
    } else if (_selectedIndex == 1) {
      return const HeadlineScreen();
    } else if (_selectedIndex == 2) {
      return const FollowingScreen();
    } else {
      return const NewsstandScreen();
    }
  }
}
