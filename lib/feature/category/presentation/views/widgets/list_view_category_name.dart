import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/models/category_model.dart';
import 'package:smile_shop/feature/home_layout/presentation/manager/home_cubit/home_layout_cubit.dart';

class ListViewCategoryName extends StatelessWidget {
  const ListViewCategoryName({super.key, required this.model});

  final List<Data2> model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeLayoutCubit>(context);
        return ListView.builder(
          itemBuilder: (context, index) => Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                cubit.changeIndex(index: index);
              },
              child: Container(
                height: 80,
                color: cubit.index1 == index
                    ? Colors.transparent
                    : Colors.grey[200],
                child: Center(
                  child: Text(
                    model[index].name ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          itemCount: model.length,
        );
      },
    );
  }
}
