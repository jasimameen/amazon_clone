import 'package:amazon_clone/features/account/widgets/curved_dash_button.dart';
import 'package:flutter/material.dart';

class AccountPageDashButtonsSection extends StatelessWidget {
  const AccountPageDashButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 16 / 3,
      children: [
        // first row
        // your orders button
        CurvedDashButton(
          onTap: () {},
          label: 'Your Orders',
        ),

        // turn to selller button
        CurvedDashButton(
          onTap: () {},
          label: 'Turn Seller',
        ),

        // second row
        // logOut button
        CurvedDashButton(
          onTap: () {},
          label: 'Log Out',
        ),

        // your wishlist button
        CurvedDashButton(
          onTap: () {},
          label: 'Your Wishlist',
        ),
      ],
    );
  }
}
