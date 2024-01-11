import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import 'base.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitialState());

  void onWidgetDidInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final players = prefs.getString("players");
    List<PlayerModel> readedPlayers = players != null
        ? (jsonDecode(players) as List)
            .map((e) => PlayerModel.fromJson(e))
            .toList()
        : [];
    emit(BaseLoadedState(prefs: prefs, listOfPlayers: readedPlayers));
  }
}
