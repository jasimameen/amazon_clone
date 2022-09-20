import 'package:amazon_clone/constants/global_vaiables.dart';
import 'package:flutter/material.dart';

void showSnakBar(String msg) {
  scaffoldMessengerKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
