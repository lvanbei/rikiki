import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_players.dart';

class AddPlayersCubit extends Cubit<AddPlayersState> {
  AddPlayersCubit() : super(AddPlayersInitialState());

  void onWidgetDidInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final players = prefs.getString("players");
    emit(AddPlayersLoadedState(
      listOfPlayers: players != null
          ? (jsonDecode(players) as List)
              .map((e) => PlayerModel.fromJson(e))
              .toList()
          : [],
      controller: TextEditingController(),
      prefs: prefs,
    ));
  }

  void onSubmitPlayer() {
    final currentState = state as AddPlayersLoadedState;
    final newPlayer = currentState.controller.text;
    if (newPlayer.isNotEmpty) {
      final currentPlayers = currentState.listOfPlayers;
      currentState.controller.text = '';
      currentPlayers.add(PlayerModel(
        name: newPlayer,
        folds: [FoldsModel()],
      ));
      emit(currentState.copyWith(listOfPlayers: currentPlayers));
      currentState.prefs.setString("players",
          jsonEncode(currentPlayers.map((e) => e.toJson()).toList()));
    }
  }

  void onDeletePlayer(int index) {
    final currentState = state as AddPlayersLoadedState;
    final currentPlayers = currentState.listOfPlayers;
    currentPlayers.removeAt(index);
    emit(currentState.copyWith(listOfPlayers: currentPlayers));
    currentState.prefs.setString(
        "players", jsonEncode(currentPlayers.map((e) => e.toJson()).toList()));
  }
}
