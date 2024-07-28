import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<BottomNavBarState> {
  MainCubit() : super(BottomNavBarState(selectedIndex: 0));
  void selectTab(int tabIndex) {
    emit(BottomNavBarState(selectedIndex: tabIndex));

  }


  
}
