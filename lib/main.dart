import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/global_vaiables.dart';
import 'features/auth/screens/auth_screen.dart';
import 'router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AuthService().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // token excits or not
    final isTokenEmpty = Provider.of<UserProvider>(context).user.token.isEmpty;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,

        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),

        // appBar theme
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        //
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
              (states) => GlobalVariables.secondaryColor),
        ),
      ),
      routes: routes,

      // user redireted to MainScreen if alredy logged in
      // else Login screen shows
      home: isTokenEmpty ? const AuthScreen() : const BottomBar(),

    );
  }
}
