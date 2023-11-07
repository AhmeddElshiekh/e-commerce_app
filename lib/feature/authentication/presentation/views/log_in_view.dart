import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';
import 'package:smile_shop/core/utils/snack_bar.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/log_in_view_body.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/home_layout_view.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ShopLoginSuccessfulState) {
          if (state.authModel.status == true) {
            CacheHelper.saveData(key: 'token', value: state.authModel.data!.token);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeLayoutView(),
              ),
            );
            snackBar(context,
                massage: state.authModel.massage!, color: Colors.green);
          } else {
            snackBar(context,
                massage: state.authModel.massage!, color: Colors.red);
          }
        }

        if (state is ShopLoginErrorState) {
          snackBar(context, massage: state.errMassage, color: Colors.red);
        }
      },
      child: const Scaffold(
        body: LogInViewBody(),
      ),
    );
  }
}
