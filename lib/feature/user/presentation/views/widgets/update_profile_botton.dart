import 'package:flutter/material.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:smile_shop/feature/user/presentation/views/update_profile_view.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: MediaQuery.of(context).size.width * .45,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfileView(),));
      },
      text: 'Update Profile',
    );  }
}
