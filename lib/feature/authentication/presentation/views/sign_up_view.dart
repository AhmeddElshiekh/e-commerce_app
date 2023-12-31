import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/snack_bar.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/log_in_view.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckInternetCubit, CheckInternetState>(
      listener: (context, state) {
        if (state is ConnectedState) {
          customSnackBar(context,
              massage: state.message, color: Colors.green);

        }
        if (state is NotConnectedState) {
          customSnackBar(context,
              massage: state.message, color: Colors.red);
        }
      },
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);
          if (state is ShopRegisterSuccessfulState) {
            if (state.authModel.status == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogInView(),
                ),
              );

              customSnackBar(context,
                  massage: state.authModel.massage!, color: Colors.green);
              Future.delayed(
                const Duration(seconds: 10),
                    () {
                  cubit.regNameController.clear();
                  cubit.regPasswordController.clear();
                  cubit.regEmailController.clear();
                  cubit.regPhoneController.clear();
                },
              );
            } else {
              customSnackBar(context,
                  massage: state.authModel.massage!, color: Colors.red);
            }
          }

          if (state is ShopRegisterErrorState) {
            customSnackBar(
                context, massage: state.errMassage, color: Colors.red);
          }
        },
        child: const Scaffold(
          body: SingUpViewBody(),
        ),
      ),
    );
  }
}
