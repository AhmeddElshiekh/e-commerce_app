import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/category_component.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/loading_category_name.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/success_category_name.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 20),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  if (state is HomeGetCategoryHomeSuccessfulState)
                    SuccessCategoryName(model: state.model),
                  if (state is HomeGetCategoryHomeLoadingState)
                    const LoadingCategoryName(),
                  if (state is HomeGetCategoryHomeErrorState)
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Text(
                        state.errMassage,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),

                  const CategoryComponent()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
