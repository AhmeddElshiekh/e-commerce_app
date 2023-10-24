import 'package:flutter/material.dart';
import 'package:smile_shop/generated/assets.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: Assets.fontsDancingScriptVariableFontWght,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
