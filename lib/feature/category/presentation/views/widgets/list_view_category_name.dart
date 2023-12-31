import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smile_shop/core/models/category_model.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';

class ListViewCategoryName extends StatelessWidget {
  const ListViewCategoryName({super.key, required this.model});

  final List<Data2> model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeLayoutCubit>(context);
        return AnimationLimiter(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    horizontalOffset: -850,
                    verticalOffset: -300,
                    child: InkWell(
                      onTap: () {
                        cubit.changeIndex(index: index);
                      },
                      child: Container(
                        color: cubit.index1 == index
                            ? Colors.transparent
                            : Colors.grey[200],
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              height: 15,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: cubit.index1 != index
                                    ? Colors.transparent
                                    : Colors.deepPurple,
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  model[index].name ?? '',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: model.length,
            ),
          ),
        );
      },
    );
  }
}
