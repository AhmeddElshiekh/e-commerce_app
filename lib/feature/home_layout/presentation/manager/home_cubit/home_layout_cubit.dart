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


  List<num> id = [
    44,
    43,
    42,
    40,
    46,
  ];

  int value = 0;
  void plus(){
    value++;
    emit(ProductDetailPlusState());
  }

  void minus(){
    value > 0 ? value-- : 0;
    emit(ProductDetailMinusState());
  }

}
