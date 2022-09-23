// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavBarWidth = 42;
  double bottomNavBarBoderWidth = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          // home
          BottomNavigationBarItem(
            icon: _CustomBottomNavBarIcon(
              currentPageIndex: _page,
              itemIndex: 0,
              iconData: Icons.home_outlined,
            ),
            label: '',
          ),

          // Account
          BottomNavigationBarItem(
            icon: _CustomBottomNavBarIcon(
              currentPageIndex: _page,
              itemIndex: 1,
              iconData: Icons.person_outlined,
            ),
            label: '',
          ),

          // Cart
          BottomNavigationBarItem(
            icon: _CustomBottomNavBarIcon(
              currentPageIndex: _page,
              itemIndex: 2,
              iconData: Icons.local_grocery_store_outlined,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNavBarIcon extends StatelessWidget {
  final int currentPageIndex;
  final int itemIndex;
  final IconData iconData;

  const _CustomBottomNavBarIcon({
    Key? key,
    required this.currentPageIndex,
    required this.itemIndex,
    required this.iconData,
  }) : super(key: key);

  final double bottomNavBarWidth = 42;
  final double bottomNavBarBoderWidth = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bottomNavBarWidth,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color:
                currentPageIndex == itemIndex // checks selected or unselected
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
            width: bottomNavBarBoderWidth,
          ),
        ),
      ),
      child: Icon(iconData),
    );
  }
}
