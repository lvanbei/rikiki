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
    final List<PlayerModel> displayedListOfPlayers = [
      ...(baseCubit.state as BaseLoadedState).games[selectedGameIndex].players
    ];

    final listOfPlayers =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].players;
    final int round =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].round;
    final int rounds =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].rounds;

    final int? pointPerFold = (baseCubit.state as BaseLoadedState)
        .games[selectedGameIndex]
        .pointsPerFold;

    displayedListOfPlayers.sort((a, b) => a.position.compareTo(b.position));
    emit(AddPlayersLoadedState(
      listOfPlayers: listOfPlayers,
      displayedListOfPlayers: displayedListOfPlayers,
      controller: TextEditingController(),
      round: round,
      rounds: rounds,
      pointsPerFold: pointPerFold ?? 2,
      increasePointPerFold: pointPerFold == null,
    ));
  }

  void updatePointsPerFold({bool isPlus = false, bool longPress = false}) {
    final currentState = state as AddPlayersLoadedState;
    final currentPointPerFold = currentState.pointsPerFold;
    int newPoint = currentPointPerFold;
    if (isPlus) {
      newPoint += 1;
      return emit(currentState.copyWith(pointsPerFold: newPoint));
    }
    emit(currentState.copyWith(pointsPerFold: currentPointPerFold - 1));
  }

  void onSubmitPlayer() {
    final currentState = state as AddPlayersLoadedState;
    final newPlayer = currentState.controller.text;
    currentState.controller.text = '';

    final currentPlayers = currentState.listOfPlayers;
    final currentDisplayedPlayers = currentState.displayedListOfPlayers;

    currentDisplayedPlayers.add(PlayerModel(
      position: currentDisplayedPlayers.length,
      name: newPlayer,
      folds: [],
    ));
    currentPlayers.add(currentDisplayedPlayers.last);

    emit(
        currentState.copyWith(displayedListOfPlayers: currentDisplayedPlayers));

    baseCubit.updatePlayers(currentPlayers);
  }

  void onDeletePlayer(int index, String name) {
    final currentState = state as AddPlayersLoadedState;
    final currentPlayers = currentState.listOfPlayers;
    final currentDisplayedPlayers = currentState.displayedListOfPlayers;

    currentDisplayedPlayers.removeAt(index);
    currentPlayers.removeWhere((element) => element.name == name);

    emit(
        currentState.copyWith(displayedListOfPlayers: currentDisplayedPlayers));
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

  void updateFoldList() {
    final currentState = state as AddPlayersLoadedState;
    final currentPlayers = currentState.listOfPlayers;
    final int newRounds = ((52 / currentPlayers.length).floor() * 2) - 1;
    final int oldRounds = currentState.rounds;
    final int currentRound = currentState.round;
    int setRounds = newRounds;

    if (oldRounds != 0) {
      // added a player during the game
      if (newRounds < oldRounds) {
        // current round is above existing new rounds
        if (currentRound > (newRounds / 2).floor()) {
          int newRound = ((currentRound / oldRounds) * newRounds).floor();
          baseCubit.updateRound(newRound);
          setRounds = newRounds;
        }
      }

      // removed a player during the game
      else if (newRounds > oldRounds &&
          // update rounds if currentRound is below newRounds / 2
          currentRound > (oldRounds / 2).floor()) {
        setRounds = oldRounds;
      } else {
        setRounds = newRounds;
      }
    } else {
      setRounds = newRounds;
    }

    baseCubit.updateRounds(setRounds);

    for (var player in currentPlayers) {
      player.point = 0;
      player.folds = List.generate(setRounds, (int index) {
        if (player.folds.isNotEmpty &&
            index < player.folds.length &&
            player.folds[index].announcedFolds != 0 &&
            player.folds[index].makedFolds != 0) {
          return FoldsModel(
            announcedFolds: player.folds[index].announcedFolds,
            makedFolds: player.folds[index].makedFolds,
          );
        }
        return FoldsModel();
      });
    }

    baseCubit.updatePlayers(currentPlayers);
    baseCubit.updatePointPerFold(
        currentState.increasePointPerFold ? null : currentState.pointsPerFold);
  }

  void updateIncreasePointPerFold(bool status) {
    final currentState = state as AddPlayersLoadedState;
    emit(currentState.copyWith(increasePointPerFold: status));
  }
}
