import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/feature/category/presentation/views/category_view.dart';
import 'package:smile_shop/feature/favorite/presentation/views/favorite_view.dart';
import 'package:smile_shop/feature/home/presentation/views/home_view.dart';
import 'package:smile_shop/feature/user/presentation/views/user_view.dart';


part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeInitial());
  HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List <Widget> screens = const [
    HomeView(),
    CategoryView(),
    FavoriteView(),
    UserView(),
  ];


  void changeIndex ({required int index}){
    currentIndex = index;
    emit(HomeChangeIndexBottomNav());

  }




}
