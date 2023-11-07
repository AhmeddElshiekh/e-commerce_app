import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/feature/category/presentation/views/widgets/loading_list_view_cart_and_favorite.dart';
import 'package:smile_shop/feature/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:smile_shop/feature/favorite/presentation/views/widgets/list_view_favorite.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is GetAllFavoriteSuccessfulState) {
          return ListViewFavorite(state: state.dataFavorite2);
        } else if (state is GetAllFavoriteErrorState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              state.errMassage,
              style: const TextStyle(fontSize: 20),
            ),
          );
        } else {
          return LoadingListViewCartAndFavorite(
            height: MediaQuery.of(context).size.height * .7,
          );
        }
      },
    );
  }
}
