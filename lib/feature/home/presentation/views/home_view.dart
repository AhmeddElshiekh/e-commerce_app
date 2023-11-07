import 'package:flutter/material.dart';
import 'package:smile_shop/core/utils/styles.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/check_grid_view_states_home.dart';
import 'package:smile_shop/feature/home/presentation/views/widgets/check_state_category_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category', style: Styles.textStyle40),
              SizedBox(
                height: 10,
              ),
              CheckStateCategoryHome(),
              CheckGradViewStatesHome(),
            ],

          ),
        ),
      ),
    );
  }
}
