import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki/core/core.dart';

import '../base/base.dart';
import 'add_players.dart';

class AddPlayersCubit extends Cubit<AddPlayersState> {
  final BaseCubit baseCubit;
  AddPlayersCubit({required this.baseCubit}) : super(AddPlayersInitialState());

  void onWidgetDidInit() {
    if ((baseCubit.state as BaseLoadedState).games.isEmpty) {
      return;
    }
    final int selectedGameIndex =
        (baseCubit.state as BaseLoadedState).selectedGameIndex;
    final List<PlayerModel> listOfPlayers = [
      ...(baseCubit.state as BaseLoadedState).games[selectedGameIndex].players
    ];
    final int round =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].round;

    listOfPlayers.sort((a, b) => a.position.compareTo(b.position));
    emit(AddPlayersLoadedState(
      listOfPlayers: listOfPlayers,
      controller: TextEditingController(),
      round: round,
    ));
  }

  void onSubmitPlayer() {
    final currentState = state as AddPlayersLoadedState;
    final newPlayer = currentState.controller.text;

    final currentPlayers = currentState.listOfPlayers;
    currentState.controller.text = '';
    currentPlayers.add(PlayerModel(
      position: currentPlayers.length,
      name: newPlayer,
      folds: [],
    ));
    emit(currentState.copyWith(listOfPlayers: currentPlayers));
    baseCubit.updatePlayers(currentPlayers);
  }

  void onDeletePlayer(int index) {
    final currentState = state as AddPlayersLoadedState;
    final currentPlayers = currentState.listOfPlayers;
    currentPlayers.removeAt(index);
    emit(currentState.copyWith(listOfPlayers: currentPlayers));
    baseCubit.updatePlayers(currentPlayers);
  }

  String? playerNameValidator(String? playerName) {
    if (playerName != null) {
      final currentState = state as AddPlayersLoadedState;

      if (playerName.isNotEmpty && currentState.playersLimit) {
        return "Max 10 players.";
      }
      if (currentState.playerAlreadyExist) {
        return "Player already in list.";
      }
    }
    return null;
  }

  Future updateFoldList() async {
    final currentState = state as AddPlayersLoadedState;
    final currentPlayers = currentState.listOfPlayers;
    final rounds = ((52 / currentPlayers.length).floor() * 2) - 1;
    for (var player in currentPlayers) {
      player.points = 0;
      player.point = 0;
      player.folds = List.generate(rounds, (_) => FoldsModel());
    }
    await baseCubit.updatePlayers(currentPlayers);
  }
}
