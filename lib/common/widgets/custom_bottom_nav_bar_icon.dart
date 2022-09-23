
import 'package:flutter/widgets.dart';

import '../../constants/global_vaiables.dart';

class CustomBottomNavBarIcon extends StatelessWidget {
  final int currentPageIndex;
  final int itemIndex;
  final IconData iconData;

  const CustomBottomNavBarIcon({
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