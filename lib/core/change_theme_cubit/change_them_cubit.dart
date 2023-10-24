import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shop/core/utils/cache_helper.dart';

part 'change_them_state.dart';

class ChangeThemCubit extends Cubit<ChangeThemState> {
  ChangeThemCubit() : super(ChangeThemInitial());

  static ChangeThemCubit get(context) => BlocProvider.of(context);

  bool isLight = true;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isLight = fromShared;

      emit(ChangeModeState());
    } else {
      isLight = !isLight;
      CacheHelper.saveData(key: 'mode', value: isLight).then((value) {
        emit(ChangeModeState());
      });
    }
  }

}
