import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/snack_bar.dart';
import 'package:smile_shop/core/utils/snack_bar_back.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/home/presentation/manager/get_all_products_cubit/get_products_cubit.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_bottom_nav_bar.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/home_layout_view_body.dart';
import 'package:smile_shop/feature/user/presentation/manager/log_out_cubit/log_out_cubit.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getCategoryHome(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit()..getAllProductHome(),
        ),
        BlocProvider(
          create: (context) => LogOutCubit(),
        )
      ],
      child: BlocListener<CheckInternetCubit, CheckInternetState>(
        listener: (context, state) {
          if (state is ConnectedState) {
            BlocProvider.of<HomeCubit>(context).getCategoryHome();
            BlocProvider.of<GetProductsCubit>(context).getAllProductHome();

            customSnackBar(context,
                massage: state.message, color: Colors.green);
          }
          if (state is NotConnectedState) {
            customSnackBar(context, massage: state.message, color: Colors.red);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              'Smile Shop',
              style: Styles.textStyle30,
            ),
          ),
          body: doubleTap(
            widget: const HomeLayoutViewBody(),
          ),
          bottomNavigationBar: const HomeLayoutBottomNavBar(),
        ),
      ),
    );
  }
}
