// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_folds_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetFoldsLoadedStateCWProxy {
  SetFoldsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  SetFoldsLoadedState round(int round);

  SetFoldsLoadedState foldTotal(int foldTotal);

  SetFoldsLoadedState turn(int turn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetFoldsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetFoldsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SetFoldsLoadedState call({
    List<PlayerModel>? listOfPlayers,
    int? round,
    int? foldTotal,
    int? turn,
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
  SetFoldsLoadedState foldTotal(int foldTotal) => this(foldTotal: foldTotal);

  @override
  SetFoldsLoadedState turn(int turn) => this(turn: turn);

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
    Object? foldTotal = const $CopyWithPlaceholder(),
    Object? turn = const $CopyWithPlaceholder(),
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
      foldTotal: foldTotal == const $CopyWithPlaceholder() || foldTotal == null
          ? _value.foldTotal
          // ignore: cast_nullable_to_non_nullable
          : foldTotal as int,
      turn: turn == const $CopyWithPlaceholder() || turn == null
          ? _value.turn
          // ignore: cast_nullable_to_non_nullable
          : turn as int,
    );
  }
}

extension $SetFoldsLoadedStateCopyWith on SetFoldsLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfSetFoldsLoadedState.copyWith(...)` or like so:`instanceOfSetFoldsLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetFoldsLoadedStateCWProxy get copyWith =>
      _$SetFoldsLoadedStateCWProxyImpl(this);
}
