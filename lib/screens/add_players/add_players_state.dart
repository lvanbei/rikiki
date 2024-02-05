import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:rikiki/core/core.dart';

part 'add_players_state.g.dart';

abstract class AddPlayersState {
  const AddPlayersState();
}

class AddPlayersInitialState extends AddPlayersState {}

@CopyWith()
class AddPlayersLoadedState extends AddPlayersState {
  List<PlayerModel> listOfPlayers;
  final TextEditingController controller;
  final int round;

  AddPlayersLoadedState({
    required this.listOfPlayers,
    required this.controller,
    required this.round,
  });

  bool get playersLimit => listOfPlayers.length >= 10;

  bool get enoughPlayer => listOfPlayers.length > 2;

  bool get continueGame => round > 0;

  bool get playerAlreadyExist {
    final res = listOfPlayers.firstWhereOrNull(
            (PlayerModel element) => element.name == controller.text) !=
        null;
    return res;
  }
}
