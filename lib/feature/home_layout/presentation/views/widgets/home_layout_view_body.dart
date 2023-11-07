import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/category/presentation/views/cart_view.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/views/widgets/custom_text_form_filed.dart';

class HomeLayoutViewBody extends StatelessWidget {
  const HomeLayoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var cubit = HomeLayoutCubit().get(context);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if(cubit.currentIndex < 3 )
                Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .80,
                          child: const CustomTextFormFiled(
                            label: 'Search',
                            hint: 'What do you search for?',
                            prefixIcon: Icon(IconBroken.Search),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          )),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartView(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              cubit.screens[cubit.currentIndex]
            ],
          ),
        );
      },
    );
  }
}
