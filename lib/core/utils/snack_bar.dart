
import 'package:flutter/material.dart';

void snackBar(context,{
  required String massage,
  required Color color,
}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Text(massage),
    ),
  );
}