import 'dart:convert';

import 'package:amazon_clone/common/widgets/bottom_bar.dart';

import '../../../constants/apis.dart';
import '../../../constants/error_handle.dart';
import '../../../constants/utils.dart';
import '../../home/screens/home_screen.dart';
import '../../../models/user.dart';
import '../../../providers/user_provider.dart';
import '../../../router.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_vaiables.dart';

class AuthService {
  // signup
  void signUpUser(String email, String password, String name) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      final resp = await http.post(
        Uri.parse(Apis.signUp),
        body: user.toJson(),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      httpErrorHandle(
        response: resp,
        onSuccess: () {
          showSnakBar('Accound Create SuccessFully!');

          // signIn new user
          signInUser(email, password);
        },
      );
    } catch (error) {
      //
      showSnakBar(error.toString());
    }
  }

  // sign In
  void signInUser(String email, String password) async {
    try {
      final jsonBody = json.encode({"email": email, "password": password});

      final resp = await http.post(
        Uri.parse(Apis.signIn),
        body: jsonBody,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      httpErrorHandle(
        response: resp,
        onSuccess: () async {
          Provider.of<UserProvider>(currentContext, listen: false)
              .setUser(resp.body);

          final pref = await SharedPreferences.getInstance();
          await pref.setString(X_AUTH_TOKEN, json.decode(resp.body)['token']);

          navigation.pushNamedAndRemoveUntil(
              BottomBar.routeName, (route) => false);
        },
      );
    } catch (error) {
      showSnakBar(error.toString());
    }
  }

  // get user data
  void getUserData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString(X_AUTH_TOKEN);
      if (token == null) pref.setString(X_AUTH_TOKEN, '');

      // api respond with a boolean valiue true if valid user else false
      final resp = await http.post(
        Uri.parse(Apis.verifyToken),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );
      // get data inside the responce
      bool isValidUser = json.decode(resp.body);

      // update user data after user validation
      if (isValidUser) {
        // getUserData
        await http.get(
          Uri.parse(Apis.user),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        ).then((value) {
          // update userdata in the state
          Provider.of<UserProvider>(currentContext, listen: false)
              .setUser(value.body);
        }).catchError((_) {
          return;
        });
      }
    } catch (error) {
      showSnakBar(error.toString());
    }
  }
}
