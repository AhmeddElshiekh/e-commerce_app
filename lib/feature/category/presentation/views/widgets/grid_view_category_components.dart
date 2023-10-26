import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/cached_network_image.dart';
import 'package:smile_shop/feature/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/loading_grid_view_category_components.dart';

class GridViewCategoryComponents extends StatelessWidget {
  const GridViewCategoryComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccessfulState) {
          if (state.model.isNotEmpty) {
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.model.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  return Card(
                      clipBehavior: Clip.hardEdge,
                      child:
                          CachedImage(imageUrl: state.model[index].images![0]));
                });
          } else {
            return Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: MediaQuery.of(context).size.height * .1,
                  horizontal: 15),
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
