// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:amazon_clone/features/account/screens/acount_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_nav_bar_icon.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  double bottomNavBarWidth = 42;
  double bottomNavBarBoderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text("User Cart")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // screens
      body: pages[_currentIndex],

      // Navigaton bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // home
          BottomNavigationBarItem(
            icon: CustomBottomNavBarIcon(
              currentPageIndex: _currentIndex,
              itemIndex: 0,
              iconData: Icons.home_outlined,
            ),
            label: '',
          ),

          // Account
          BottomNavigationBarItem(
            icon: CustomBottomNavBarIcon(
              currentPageIndex: _currentIndex,
              itemIndex: 1,
              iconData: Icons.person_outlined,
            ),
            label: '',
          ),

          // Cart
          BottomNavigationBarItem(
            icon: Badge(
              elevation: 0,
              badgeColor: Colors.white,
              badgeContent: const Text('5'),
              child: CustomBottomNavBarIcon(
                currentPageIndex: _currentIndex,
                itemIndex: 2,
                iconData: Icons.local_grocery_store_outlined,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  void updatePage(index) => setState(() => _currentIndex = index);
}

