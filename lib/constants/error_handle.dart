import 'dart:convert';

import 'utils.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case (200):
      onSuccess();
      break;
    case (400):
      showSnakBar(jsonDecode(response.body)['msg']);
      break;
    case (500):
      showSnakBar(jsonDecode(response.body)['error']);
      break;
    default:
      showSnakBar('Something went Wrong!!');
  }
}
