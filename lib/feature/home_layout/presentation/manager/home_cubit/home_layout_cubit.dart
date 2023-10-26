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

  changeIndexNavBarTo1(){
    currentIndex = 1;
    emit(HomeChangeIndexBottomNavTo1());
  }

  void changeIndexNavBar ({required int index}){
    currentIndex = index;
    emit(HomeChangeIndexBottomNav());

  }

  Color color = Colors.transparent;
  late int index1 = 0 ;
  void changeIndex({required int index}){
    index1 = index;
    emit(CategoryChangeIndexState());
  }


  List<String> categoryId = [
    '6439d61c0049ad0b52b90051',
    '6439d5b90049ad0b52b90048',
    '6439d58a0049ad0b52b9003f',
    '6439d41c67d9aa4ca97064d5',
    '6439d40367d9aa4ca97064cc',
    '6439d3e067d9aa4ca97064c3',
    '6439d3c867d9aa4ca97064ba',
    '6439d30b67d9aa4ca97064b1',
    '6439d2f467d9aa4ca97064a8',
    '6439d2d167d9aa4ca970649f',
  ];

}
