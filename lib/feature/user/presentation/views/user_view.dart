import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'User',
          style: TextStyle(fontSize: 28),
        ),
      ],
    );
  }
}
