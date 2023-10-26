import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';

class HomeLayoutBottomNavBar extends StatelessWidget {
  const HomeLayoutBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var cubit = HomeLayoutCubit().get(context);

        return BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndexNavBar(index: index);
            },
            selectedItemColor: Colors.deepPurple,
             unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Category),
                label: 'Category'
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Heart),
                  label: 'Favorite'

              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.User),
                  label: 'User'

              ),

            ]);
      },
    );
  }
}
