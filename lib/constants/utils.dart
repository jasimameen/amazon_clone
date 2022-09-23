import 'package:flutter/material.dart';

import 'global_vaiables.dart';

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
