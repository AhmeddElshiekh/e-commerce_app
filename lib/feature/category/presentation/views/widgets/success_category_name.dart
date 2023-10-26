import 'package:flutter/material.dart';
import 'package:smile_shop/core/models/category_model.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/list_view_category_name.dart';

class SuccessCategoryName extends StatelessWidget {
  const SuccessCategoryName({super.key, required this.model});

  final List<Data2> model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .4,
          margin: const EdgeInsetsDirectional.only(
              top: 6.0, start: 6.0, bottom: 6.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                bottomStart: Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ListViewCategoryName(model: model),
        ),
      ),
    );
  }
}
