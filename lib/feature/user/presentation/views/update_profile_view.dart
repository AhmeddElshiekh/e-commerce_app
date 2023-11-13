import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/user/presentation/manager/user_cubit/user_cubit.dart';
import 'package:smile_shop/feature/user/presentation/views/widgets/update_profile_view_body.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

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
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Update Your Profile',
                style: Styles.textStyle30,
              ),
            ),
            body: const UpdateProfileViewBody()),
      ),
    );
  }
}
