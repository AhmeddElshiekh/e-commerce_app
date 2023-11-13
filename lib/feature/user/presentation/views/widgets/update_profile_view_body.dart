import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/core/utils/snack_bar.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:smile_shop/feature/user/presentation/manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:smile_shop/feature/user/presentation/manager/user_cubit/user_cubit.dart';
import 'package:smile_shop/feature/user/presentation/views/widgets/user_text_form_filed.dart';

class UpdateProfileViewBody extends StatelessWidget {
  const UpdateProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        var userCubit = BlocProvider.of<UserCubit>(context);
        return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (BuildContext context, UpdateProfileState state) {
            if (state is UpdateProfileErrorState) {
              customSnackBar(context,
                  massage: state.errMassage, color: Colors.red);
            }
            if (state is UpdateProfileSuccessfulState) {
              if (state.authModel.status == false) {
                customSnackBar(context,
                    massage: state.authModel.massage!, color: Colors.red);
              } else {
                customSnackBar(context,
                    massage: state.authModel.massage!, color: Colors.green);
                userCubit.getUserData();
              }
            }
          },
          builder: (context, states) {
            var updateCubit = BlocProvider.of<UpdateProfileCubit>(context);
            if (state is GetUserSuccessfulState) {
              updateCubit.phoneController.text = state.authModel.data!.phone!;
              updateCubit.nameController.text = state.authModel.data!.name!;
              updateCubit.emailController.text = state.authModel.data!.email!;
            }

            return Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        if (state is GetUserSuccessfulState)
                          Text(
                            'Welcome, ${state.authModel.data!.name!.split(" ")[0].toUpperCase()}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        if (state is GetUserSuccessfulState)
                          Text(
                            '  ${state.authModel.data!.email}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          ),
                        if (state is GetUserLoadingState)
                          Shimmer.fromColors(
                            baseColor: baseColor,
                            highlightColor: highlightColor,
                            child: Container(
                              height: 20,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                            ),
                          ),

                        if (state is GetUserLoadingState)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer.fromColors(
                              baseColor: baseColor,
                              highlightColor: highlightColor,
                              child: Container(
                                height: 20,
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                              ),
                            ),
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
                          controller: updateCubit.nameController,
                          enabled: true,
                          label: 'Name',
                          prefixIcon: IconBroken.Profile,
                          inputType: TextInputType.name,
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
                          controller: updateCubit.emailController,
                          enabled: true,
                          label: 'Email',
                          prefixIcon: Icons.alternate_email,
                          inputType: TextInputType.emailAddress,
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
                          controller: updateCubit.phoneController,
                          enabled: true,
                          label: 'Phone',
                          prefixIcon: IconBroken.Call,
                          inputType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        if (states is! UpdateProfileLoadingState)
                          AbsorbPointer(
                            absorbing: state is GetUserLoadingState? true :false,
                            child: CustomTextButton(
                              onPressed: () {
                                updateCubit.updateProfile();
                              },
                              text: 'Update',
                            ),
                          ),
                        if (states is UpdateProfileLoadingState)
                          const Center(child: CircularProgressIndicator())
                      ],
                    ),
                  ),
                ),
                if (state is GetUserLoadingState)
                  Center(
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey[400],
                        ),
                        child:
                            const Center(child: CircularProgressIndicator())),
                  )
              ],
            );
          },
        );


      },
    );
  }
}
