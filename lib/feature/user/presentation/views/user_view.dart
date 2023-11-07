import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/feature/user/presentation/manager/user_cubit/user_cubit.dart';
import 'package:smile_shop/feature/user/presentation/views/widgets/user_text_form_filed.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserSuccessfulState) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome, ${state.authModel.data!.name!.split(" ")[0].toUpperCase()}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  '  ${state.authModel.data!.email}',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Your full name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                UserTextFormFiled(
                  label: state.authModel.data!.name,
                  prefixIcon: IconBroken.Profile,
                  suffixIcon: IconBroken.Edit_Square,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your E-mail',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                UserTextFormFiled(
                  label: state.authModel.data!.email,
                  prefixIcon: Icons.alternate_email,
                  suffixIcon: IconBroken.Edit_Square,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your phone number',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                UserTextFormFiled(
                  label: state.authModel.data!.phone,
                  prefixIcon: IconBroken.Call,
                  suffixIcon: IconBroken.Edit_Square,
                ),
              ],
            ),
          );
        } else if (state is GetUserErrorState) {
          return Text(state.errMassage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
