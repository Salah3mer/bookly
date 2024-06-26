import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool isDark = false;
  void changeTheme() {
    emit(ThemeLoadingState());
    isDark = !isDark;
    emit(ThemeSuccessState());
  }
}
