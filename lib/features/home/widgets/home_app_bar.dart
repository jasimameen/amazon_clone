import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
      child: AppBar(
        flexibleSpace: Text('Hellow this is the search field'),
      ),
    );
  }
}
