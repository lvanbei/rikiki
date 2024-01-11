import 'package:flutter_bloc/flutter_bloc.dart';

import 'play.dart';

class PlayCubit extends Cubit<PlayState> {
  PlayCubit() : super(PlayInitialState());

  void onWidgetDidInit() {
    emit(PlayLoadedState());
  }
}
