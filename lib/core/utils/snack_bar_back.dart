import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

Widget doubleTap({required Widget widget}) => DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text('Tap back again to leave'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
      child: widget,
    );
