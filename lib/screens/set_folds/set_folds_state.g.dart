// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_folds_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetFoldsLoadedStateCWProxy {
  SetFoldsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  SetFoldsLoadedState round(int round);

  SetFoldsLoadedState rounds(int rounds);

  SetFoldsLoadedState displayedFold(int displayedFold);

  SetFoldsLoadedState turn(int turn);

  SetFoldsLoadedState announcedFoldTotal(List<int> announcedFoldTotal);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetFoldsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetFoldsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SetFoldsLoadedState call({
    List<PlayerModel>? listOfPlayers,
    int? round,
    int? rounds,
    int? displayedFold,
    int? turn,
    List<int>? announcedFoldTotal,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetFoldsLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetFoldsLoadedState.copyWith.fieldName(...)`
class _$SetFoldsLoadedStateCWProxyImpl implements _$SetFoldsLoadedStateCWProxy {
  const _$SetFoldsLoadedStateCWProxyImpl(this._value);

  final SetFoldsLoadedState _value;

  @override
  SetFoldsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  SetFoldsLoadedState round(int round) => this(round: round);

  @override
  SetFoldsLoadedState rounds(int rounds) => this(rounds: rounds);

  @override
  SetFoldsLoadedState displayedFold(int displayedFold) =>
      this(displayedFold: displayedFold);

  @override
  SetFoldsLoadedState turn(int turn) => this(turn: turn);

  @override
  SetFoldsLoadedState announcedFoldTotal(List<int> announcedFoldTotal) =>
      this(announcedFoldTotal: announcedFoldTotal);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetFoldsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetFoldsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SetFoldsLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
    Object? rounds = const $CopyWithPlaceholder(),
    Object? displayedFold = const $CopyWithPlaceholder(),
    Object? turn = const $CopyWithPlaceholder(),
    Object? announcedFoldTotal = const $CopyWithPlaceholder(),
  }) {
    return SetFoldsLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      round: round == const $CopyWithPlaceholder() || round == null
          ? _value.round
          // ignore: cast_nullable_to_non_nullable
          : round as int,
      rounds: rounds == const $CopyWithPlaceholder() || rounds == null
          ? _value.rounds
          // ignore: cast_nullable_to_non_nullable
          : rounds as int,
      displayedFold:
          displayedFold == const $CopyWithPlaceholder() || displayedFold == null
              ? _value.displayedFold
              // ignore: cast_nullable_to_non_nullable
              : displayedFold as int,
      turn: turn == const $CopyWithPlaceholder() || turn == null
          ? _value.turn
          // ignore: cast_nullable_to_non_nullable
          : turn as int,
      announcedFoldTotal: announcedFoldTotal == const $CopyWithPlaceholder() ||
              announcedFoldTotal == null
          ? _value.announcedFoldTotal
          // ignore: cast_nullable_to_non_nullable
          : announcedFoldTotal as List<int>,
    );
  }
}

extension $SetFoldsLoadedStateCopyWith on SetFoldsLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfSetFoldsLoadedState.copyWith(...)` or like so:`instanceOfSetFoldsLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetFoldsLoadedStateCWProxy get copyWith =>
      _$SetFoldsLoadedStateCWProxyImpl(this);
}
