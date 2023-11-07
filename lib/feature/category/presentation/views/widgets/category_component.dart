import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/feature/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/check_grid_view_states.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var homeLayoutCubit = BlocProvider.of<HomeLayoutCubit>(context);
    return BlocProvider(
        create: (context) => CategoryCubit()
          ..getCategoryProductId(
              categoryId: homeLayoutCubit.id[homeLayoutCubit.index1]),
        child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
          listener: (context, state) {
            if (state is CategoryChangeIndexState) {
              BlocProvider.of<CategoryCubit>(context).getCategoryProductId(
                  categoryId:
                      homeLayoutCubit.id[homeLayoutCubit.index1]);
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<HomeLayoutCubit>(context);
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        if (state is HomeGetCategoryHomeSuccessfulState)
                          SizedBox(
                            height: MediaQuery.of(context).size.height *.35,
                            width: double.infinity,
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: CachedImage(
                                boxFit: BoxFit.cover,
                                  imageUrl: state.model[cubit.index1].image!),
                            ),
                          ),
                        if (state is HomeGetCategoryHomeErrorState)
                          Text(
                            state.errMassage,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        const CheckGradViewStates(),
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
