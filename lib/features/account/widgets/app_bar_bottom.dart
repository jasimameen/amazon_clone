import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreenAppBarBottom extends StatelessWidget {
  const AccountScreenAppBarBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Hello, ",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),

            // username span
            TextSpan(
              text: user.name,
              style: const TextStyle(
                fontSize: 22.5,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
