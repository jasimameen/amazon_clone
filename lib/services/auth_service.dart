import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone/constants/apis.dart';
import 'package:amazon_clone/constants/error_handle.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';

import 'package:http/http.dart' as http;

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
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: resp,
        onSuccess: () {
          showSnakBar('Accound Create SuccessFully!');
        },
      );
    } catch (error) {
      //
      showSnakBar(error.toString());
    }
  }
}
