import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/sign_up_view.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/Auth_text_form_filed.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:smile_shop/generated/assets.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var logFormKey = GlobalKey<FormState>();
        var cubit = AuthCubit().get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: logFormKey,
                child: Column(
                  children: [
                    const Text('Smile Shop', style: Styles.textStyle30),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Please Sign In with your e-mail',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthTextFormFiled(
                        controller: cubit.logEmailController,
                        inputType: TextInputType.emailAddress,
                        label: 'Email Address',
                        prefixIcon: Icons.alternate_email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email address';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthTextFormFiled(
                        controller: cubit.logPasswordController,
                        inputType: TextInputType.visiblePassword,
                        label: 'Password',
                        obscure: cubit.isHide,
                        prefixIcon: IconBroken.Password,
                        suffixIcon: cubit.suffix,
                        onPressed: () {
                          cubit.showPassword();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is too short';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    if (state is ShopLoginLoadingState)
                      const Center(child: CircularProgressIndicator()),
                    if (state is! ShopLoginLoadingState)
                      CustomTextButton(
                        onPressed: () {
                          if (logFormKey.currentState!.validate()) {
                            cubit.login();

                          }
                        },
                        text: 'Login',
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Don\'t have an account ? ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpView(),
                                ),
                              );
                            },
                            child: const Text(
                              'Create account',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily:
                                    Assets.fontsDancingScriptVariableFontWght,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
