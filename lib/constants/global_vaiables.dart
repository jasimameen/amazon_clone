// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

BuildContext get currentContext => scaffoldMessengerKey.currentContext!;

/// Key for accesing JsonWebToken from persitsted storage
const String X_AUTH_TOKEN = 'x-auth-token';

/// contains all the static variables
///

/// eg: Colors, images, Styles... etc
class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static Color selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // Images
  static const amazonLogo = 'assets/images/amazon_in.png';
}
