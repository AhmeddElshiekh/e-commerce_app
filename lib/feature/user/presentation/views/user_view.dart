import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/feature/user/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:smile_shop/feature/user/presentation/manager/user_cubit/user_cubit.dart';
import 'package:smile_shop/feature/user/presentation/views/widgets/log_out_button.dart';
import 'package:smile_shop/feature/user/presentation/views/widgets/update_profile_botton.dart';
import 'package:smile_shop/feature/user/presentation/views/widgets/user_text_form_filed.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocListener<CheckInternetCubit, CheckInternetState>(
        listener: (context, state) {
          if (state is ConnectedState) {
            BlocProvider.of<UserCubit>(context).getUserData();
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, states) {
            if (states is GetUserSuccessfulState) {
              return BlocListener<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileSuccessfulState) {
                    BlocProvider.of<UserCubit>(context).getUserData();
                  }
                },
                child: Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Welcome, ${states.authModel.data!.name!.split(" ")[0].toUpperCase()}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '  ${states.authModel.data!.email}',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
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
                          label: states.authModel.data!.name,
                          prefixIcon: IconBroken.Profile,
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
                          label: states.authModel.data!.email,
                          prefixIcon: Icons.alternate_email,
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
                          label: states.authModel.data!.phone,
                          prefixIcon: IconBroken.Call,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          children: [
                            LogOutButton(),
                            Spacer(),
                            UpdateProfileButton(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (states is GetUserErrorState) {
              return Center(
                child: Text(
                  states.errMassage,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                child: const Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}
