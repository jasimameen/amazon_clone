import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/widgets.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

NavigatorState navigation = navigatorKey.currentState!;

Map<String, Widget Function(BuildContext)> routes =
     <String, WidgetBuilder>{
      AuthScreen.routeName:(context) => const AuthScreen(),
      HomeScreen.routeName:(context) => const HomeScreen(),
    };
