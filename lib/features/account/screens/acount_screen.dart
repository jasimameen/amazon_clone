import 'package:amazon_clone/features/account/views/orders.dart';
import 'package:amazon_clone/features/account/widgets/account_dash_button_section.dart';
import 'package:amazon_clone/features/account/widgets/app_bar_bottom.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/global_vaiables.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),

          // Logo
          title: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              GlobalVariables.amazonLogo,
              width: 120,
              height: 45,
              color: Colors.black,
            ),
          ),

          // trailing Action button
          actions: [
            // notification button
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
            // search button
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
            dummyWidth,
          ],
        ),
      ),
      //
      body: Column(
        children: const [
          // bottom AppBar
          AccountScreenAppBarBottom(),

          // top buttons section
          dummyHeight,
          AccountPageDashButtonsSection(),

          // Orders View
          dummyHeight,
          OrdersView(),
        ],
      ),
    );
  }
}
