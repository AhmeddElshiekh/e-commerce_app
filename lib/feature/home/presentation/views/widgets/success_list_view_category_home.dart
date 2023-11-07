import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smile_shop/core/models/category_model.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/item_category_home.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';

class SuccessListViewCategoryHome extends StatelessWidget {
  const SuccessListViewCategoryHome(
      {super.key, required this.length, required this.model});

  final int length;
  final List<Data2> model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeLayoutCubit>(context);
        return SizedBox(
          height: 200,
          child: AnimationLimiter(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: -850,
                  verticalOffset: -100,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          cubit.changeIndex(index: index);
                          cubit.changeIndexNavBarTo1();
                        },
                        child: ItemCategoryHome(model: model[index])),
                  ),
                ),
              ),
              itemCount: length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 15,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
