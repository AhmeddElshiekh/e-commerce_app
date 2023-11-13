import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/core/utils/snack_bar.dart';
import 'package:smile_shop/core/utils/snack_bar_back.dart';
import 'package:smile_shop/feature/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/log_in_view_body.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/home_layout_view.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckInternetCubit, CheckInternetState>(
      listener: (context, state) {
        if (state is ConnectedState) {
          customSnackBar(context, massage: state.message, color: Colors.green);
        }
        if (state is NotConnectedState) {
          customSnackBar(context, massage: state.message, color: Colors.red);
        }
      },
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);
          if (state is ShopLoginSuccessfulState) {
            if (state.authModel.status == true) {
              CacheHelper.saveData(
                key: 'token',
                value: state.authModel.data!.token,
              ).then((value) {
                token = state.authModel.data!.token ?? '';
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeLayoutView(),
                  ),
                  (route) => false,
                );
              });

              customSnackBar(context,
                  massage: state.authModel.massage!, color: Colors.green);
              Future.delayed(
                const Duration(seconds: 10),
                () {
                  cubit.logPasswordController.clear();
                  cubit.logEmailController.clear();
                },
              );
            } else {
              customSnackBar(context,
                  massage: state.authModel.massage!, color: Colors.red);
            }
          }

          if (state is ShopLoginErrorState) {
            customSnackBar(context,
                massage: state.errMassage, color: Colors.red);
          }
        },
        child: Scaffold(
            body: doubleTap(
          widget: const LogInViewBody(),
        )),
      ),
    );
  }
}
