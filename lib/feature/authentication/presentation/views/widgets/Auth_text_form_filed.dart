import 'package:flutter/material.dart';

class AuthTextFormFiled extends StatelessWidget {
  const AuthTextFormFiled({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputType,
    this.onChanged,
    this.onSubmit,
    this.validator,
    this.onPressed,
    this.onSaved,
    this.onEditingComplete,
    this.obscure,
  });

  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final VoidCallback? onPressed;
  final bool? obscure ;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure ?? false,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label ?? '',
        prefixIcon: Icon(prefixIcon,color: Colors.deepPurple,),
        hintText: hint ?? '',
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(suffixIcon,color: Colors.deepPurple,),
              )
            : null,
      ),
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onSubmit,
    );
  }
}
