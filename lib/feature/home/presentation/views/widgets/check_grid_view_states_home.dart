import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/grid_view_item.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/loading_grid_view_category_components.dart';
import 'package:smile_shop/feature/home/presentation/manager/get_all_products_cubit/get_products_cubit.dart';

class CheckGradViewStatesHome extends StatelessWidget {
  const CheckGradViewStatesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsSuccessfulState) {
          return AnimationLimiter(
            child: GridView.builder(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.8,
                mainAxisSpacing: 10,
              ),
              itemCount: state.model.length,
              itemBuilder: (BuildContext context, int index) =>
                  AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: ScaleAnimation(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          scale: .5,
                          child: FadeInAnimation(
                              child: GridViewItem(
                                  index: index, model: state.model[index])))),
            ),
          );
        } else if (state is GetAllProductsErrorState) {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
            child: Text(
              state.errMassage,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
        } else {
          return const LoadingGridViewCategoryComponents();
        }
      },
    );
  }
}
