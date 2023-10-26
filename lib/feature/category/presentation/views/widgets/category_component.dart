import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/feature/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/grid_view_category_components.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var homeLayoutCubit = BlocProvider.of<HomeLayoutCubit>(context);
    return BlocProvider(
        create: (context) => CategoryCubit()
          ..getCategoryProduct(
              categoryId: homeLayoutCubit.categoryId[homeLayoutCubit.index1]),
        child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
          listener: (context, state) {
            if (state is CategoryChangeIndexState) {
              BlocProvider.of<CategoryCubit>(context).getCategoryProduct(
                  categoryId:
                      homeLayoutCubit.categoryId[homeLayoutCubit.index1]);
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<HomeLayoutCubit>(context);
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * .53,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        if (state is HomeGetCategoryHomeSuccessfulState)
                          Card(
                            clipBehavior: Clip.hardEdge,
                            child: CachedImage(
                                imageUrl: state.model[cubit.index1].image!),
                          ),
                        if (state is HomeGetCategoryHomeErrorState)
                          Text(
                            state.errMassage,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        const GridViewCategoryComponents(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
