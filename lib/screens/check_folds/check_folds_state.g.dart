// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_folds_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckFoldsLoadedStateCWProxy {
  CheckFoldsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  CheckFoldsLoadedState round(int round);

  CheckFoldsLoadedState turn(int turn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckFoldsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckFoldsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckFoldsLoadedState call({
    List<PlayerModel>? listOfPlayers,
    int? round,
    int? turn,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCheckFoldsLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCheckFoldsLoadedState.copyWith.fieldName(...)`
class _$CheckFoldsLoadedStateCWProxyImpl
    implements _$CheckFoldsLoadedStateCWProxy {
  const _$CheckFoldsLoadedStateCWProxyImpl(this._value);

  final CheckFoldsLoadedState _value;

  @override
  CheckFoldsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  CheckFoldsLoadedState round(int round) => this(round: round);

  @override
  CheckFoldsLoadedState turn(int turn) => this(turn: turn);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckFoldsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckFoldsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckFoldsLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
    Object? turn = const $CopyWithPlaceholder(),
  }) {
    return CheckFoldsLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      round: round == const $CopyWithPlaceholder() || round == null
          ? _value.round
          // ignore: cast_nullable_to_non_nullable
          : round as int,
      turn: turn == const $CopyWithPlaceholder() || turn == null
          ? _value.turn
          // ignore: cast_nullable_to_non_nullable
          : turn as int,
    );
  }
}

extension $CheckFoldsLoadedStateCopyWith on CheckFoldsLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfCheckFoldsLoadedState.copyWith(...)` or like so:`instanceOfCheckFoldsLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckFoldsLoadedStateCWProxy get copyWith =>
      _$CheckFoldsLoadedStateCWProxyImpl(this);
}