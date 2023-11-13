
import 'package:flutter/material.dart';

void customSnackBar(context,{
  required String massage,
  required Color color,
}){
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Text(massage),
    ),
  );
}