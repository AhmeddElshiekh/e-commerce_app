import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/snack_bar.dart';
import 'package:smile_shop/feature/authentication/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/log_in_view.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ShopRegisterSuccessfulState) {
          if (state.authModel.status == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInView(),
              ),
            );

            snackBar(context,
                massage: state.authModel.massage, color: Colors.green);
          } else {
            snackBar(context,
                massage: state.authModel.massage, color: Colors.red);
          }
        }

        if (state is ShopRegisterErrorState) {
          snackBar(context, massage: state.errMassage, color: Colors.red);
        }
      },
      child: const Scaffold(
        body: SingUpViewBody(),
      ),
    );
  }
}
