import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';
import 'package:smile_shop/feature/authentication/presentation/views/log_in_view.dart';
import 'package:smile_shop/feature/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:smile_shop/feature/user/presentation/manager/log_out_cubit/log_out_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogOutCubit, LogOutState>(
      listener: (context, state) {
        if (state is ShopLogOutSuccessfulState) {
          CacheHelper.removeData(key: 'token');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInView(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LogOutCubit>(context);
        return CustomTextButton(
          width: MediaQuery.of(context).size.width * .45,
          onPressed: () {
            Alert(
              context: context,

              type: AlertType.warning,
              title: "Log Out",
              desc: "Are you sure you want to log out?",
              buttons: [
                DialogButton(
                  onPressed: ()  {
                    cubit.logOut();
                  },
                  width: 120,
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                DialogButton(
                  onPressed: ()  {
                    Navigator.pop(context);
                  },
                  width: 120,
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();

          },
          text: 'Log Out',
        );
      },
    );
  }
}
