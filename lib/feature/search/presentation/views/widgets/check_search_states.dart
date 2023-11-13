import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smile_shop/feature/home/presentation/manager/get_all_products_cubit/get_products_cubit.dart';
import 'package:smile_shop/feature/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:smile_shop/feature/search/presentation/views/widgets/success_list_view_search.dart';
import 'package:smile_shop/generated/assets.dart';

class CheckSearchStates extends StatelessWidget {
  const CheckSearchStates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit()..getAllProductHome(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchInitial) {
            return const SingleChildScrollView(
              child: Column(
                children: [
                  Image(image: AssetImage(Assets.imagesSearch)),
                  Text('Haven\'t searched for anything yet',
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          } else if (state is SearchSuccessfulState) {
            return AnimationLimiter(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        horizontalOffset: -850,
                        verticalOffset: -850,
                        child: SuccessListViewSearch(model: state.model[index])
                    ),
                  );
                },
                itemCount: state.model.length,
              ),
            );
          } else if (state is SearchErrorState) {
            return Text(
              state.errMassage,
              style: const TextStyle(
                fontSize: 20,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
