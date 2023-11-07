import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/loading_list_view_category_home.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/success_list_view_category_home.dart';

class CheckStateCategoryHome extends StatelessWidget {
  const CheckStateCategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeGetCategoryHomeSuccessfulState) {
          return SuccessListViewCategoryHome(length: state.model.length, model: state.model);
        }else if (state is HomeGetCategoryHomeErrorState){
          return Text(state.errMassage,style: const TextStyle(
            fontSize: 20
          ),);
        }
        else  {
          return const LoadingListViewCategoryHome();
        }
      },
    );
  }
}
