import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/Auth_text_form_filed.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/custom_text_button.dart';

class SingUpViewBody extends StatelessWidget {
  const SingUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var regFormKey = GlobalKey<FormState>();
        var cubit = AuthCubit().get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: regFormKey,
                child: Column(
                  children: [
                    const Text(
                      'Smile Shop',
                        style: Styles.textStyle30
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Please Sign Up with your e-mail',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFormFiled(
                        controller: cubit.nameController,
                        inputType: TextInputType.name,
                        label: 'User name',
                        prefixIcon: IconBroken.Profile,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          } else {
                            return null;
                          }
                        }
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextFormFiled(
                        controller: cubit.regEmailController,
                        inputType: TextInputType.emailAddress,
                        label: 'Email Address',
                        prefixIcon: Icons.alternate_email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email address';
                          } else {
                            return null;
                          }
                        }
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextFormFiled(
                        controller: cubit.regPasswordController,
                        inputType: TextInputType.visiblePassword,
                        label: 'Password',
                        prefixIcon: IconBroken.Password,
                        obscure: cubit.isHide,
                        suffixIcon: cubit.suffix,
                        onPressed: (){
                          cubit.showPassword();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is too short';
                          } else {
                            return null;
                          }
                        }
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextFormFiled(
                        controller: cubit.phoneController,
                        inputType: TextInputType.phone,
                        label: 'Phone',
                        prefixIcon: IconBroken.Call,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your phone';
                          } else {
                            return null;
                          }
                        }
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    if(state is ShopRegisterLoadingState)
                      const Center(child: CircularProgressIndicator()),

                    if(state is! ShopRegisterLoadingState)
                      CustomTextButton(
                      onPressed: () {
                        if (regFormKey.currentState!.validate()) {
                          cubit.register();
                        }
                      },
                      text: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
