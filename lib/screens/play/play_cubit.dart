import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'play.dart';

class PlayCubit extends Cubit<PlayState> {
  PlayCubit() : super(PlayInitialState());

  void onWidgetDidInit() async {
    //add fallback in case no users
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final players = prefs.getString("players");
    emit(PlayLoadedState(
      listOfPlayers: players != null
          ? (jsonDecode(players) as List)
              .map((e) => PlayerModel.fromJson(e))
              .toList()
          : [],
      prefs: prefs,
    ));
  }
}
