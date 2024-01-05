import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_players_state.g.dart';

abstract class AddPlayersState {
  const AddPlayersState();
}

class AddPlayersInitialState extends AddPlayersState {}

@CopyWith()
class AddPlayersLoadedState extends AddPlayersState {
  List<PlayerModel> listOfPlayers;
  final TextEditingController controller;
  final FocusNode textFieldFocusNode = FocusNode();
  final SharedPreferences prefs;
  AddPlayersLoadedState({
    required this.listOfPlayers,
    required this.controller,
    required this.prefs,
  });

  bool get playersLimit => listOfPlayers.length > 10;

  bool get enoughPlayer => listOfPlayers.length > 1;

  bool get playerAlreadyExist {
    final res = listOfPlayers.firstWhereOrNull(
            (PlayerModel element) => element.name == controller.text) !=
        null;
    return res;
  }

  String get playerNameField => 'playerName';

  FormGroup get form => fb.group(<String, Object>{
        playerNameField: [
          controller.text,
          Validators.minLength(2),
          Validators.maxLength(24),
          Validators.delegate((control) {
            if (playersLimit) {
              return <String, Object?>{
                ValidationMessage.max: <String, Object?>{}
              };
            }
            if (playerAlreadyExist) {
              return <String, Object?>{
                ValidationMessage.equals: <String, Object?>{}
              };
            }
            return null;
          }),
        ],
      });
}
