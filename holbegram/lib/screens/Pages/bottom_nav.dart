import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'feed.dart';
import 'search.dart';
import 'add_image.dart';
import 'favorite.dart';
import 'profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: const [
          Feed(),
          Search(),
          AddImage(),
          Favorite(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) {
          _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
          onPageChanged(index);
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Feed', style: TextStyle(fontSize: 25, fontFamily: 'Billabong')),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search', style: TextStyle(fontSize: 25, fontFamily: 'Billabong')),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.add_a_photo),
            title: const Text('Add', style: TextStyle(fontSize: 25, fontFamily: 'Billabong')),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text('Favorite', style: TextStyle(fontSize: 25, fontFamily: 'Billabong')),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile', style: TextStyle(fontSize: 25, fontFamily: 'Billabong')),
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
