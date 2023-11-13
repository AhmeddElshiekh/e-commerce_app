import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/cubit/check_internet/check_internet_cubit.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:smile_shop/feature/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocListener<CheckInternetCubit, CheckInternetState>(
        listener: (context, state) {
          if(state is ConnectedState){
            BlocProvider.of<SearchCubit>(context).getSearch(textSearch: BlocProvider.of<SearchCubit>(context).val);

          }

        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Smile Shop',
              style: Styles.textStyle30,
            ),
          ),
          body: const SearchViewBody(),
        ),
      ),
    );
  }
}

