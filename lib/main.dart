import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Amazon Clone'),
        ),
        body: Center(
            child: Column(
          children: [
            const Text('Flutter Amazn Home Page'),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  },
                  child: const Text('Go to Auth'));
            })
          ],
        )),
      ),

      // routing
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
