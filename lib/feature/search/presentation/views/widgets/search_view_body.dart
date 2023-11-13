import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:smile_shop/core/utils/constant.dart';
import 'package:smile_shop/feature/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:smile_shop/feature/search/presentation/views/widgets/check_search_states.dart';
import 'package:smile_shop/feature/search/presentation/views/widgets/custom_text_form_filed.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: CustomTextFormFiled(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  prefixIcon: const Icon(IconBroken.Search, color: mainColor),
                  label: 'Search',
                  onChanged: (value) {
                    BlocProvider.of<SearchCubit>(context).val = value;
                    BlocProvider.of<SearchCubit>(context)
                        .getSearch(textSearch: value);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: CheckSearchStates(),
              ),
            ],
          ),
        );
      },
    );
  }
}
