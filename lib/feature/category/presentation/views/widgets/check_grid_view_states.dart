import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/feature/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/grid_view_item.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/loading_grid_view_category_components.dart';

class CheckGradViewStates extends StatelessWidget {
  const CheckGradViewStates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccessfulState) {
          if (state.model.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 500),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
              ),
              itemCount: state.model.length,
              itemBuilder: (BuildContext context, int index) =>
                  GridViewItem(index: index, model: state.model[index]),
            );
          } else {
            return Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: MediaQuery.of(context).size.height * .1,
                horizontal: 15,
              ),
              child: const Text(
                'Sorry, we do not have any products in this category',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        } else if (state is CategoryErrorState) {
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
