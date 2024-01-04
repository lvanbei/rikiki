import 'package:flutter_bloc/flutter_bloc.dart';

import 'base.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitialState());

  void onWidgetDidInit() {
    emit(const BaseLoadedState());
  }
}
