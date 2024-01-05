// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameLoadedStateCWProxy {
  GameLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  GameLoadedState prefs(SharedPreferences prefs);

  GameLoadedState round(int round);

  GameLoadedState foldTotal(int foldTotal);

  GameLoadedState turn(int turn);

  GameLoadedState roundDirection(RoundDirection roundDirection);

  GameLoadedState gameStep(GameStep gameStep);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameLoadedState call({
    List<PlayerModel>? listOfPlayers,
    SharedPreferences? prefs,
    int? round,
    int? foldTotal,
    int? turn,
    RoundDirection? roundDirection,
    GameStep? gameStep,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameLoadedState.copyWith.fieldName(...)`
class _$GameLoadedStateCWProxyImpl implements _$GameLoadedStateCWProxy {
  const _$GameLoadedStateCWProxyImpl(this._value);

  final GameLoadedState _value;

  @override
  GameLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  GameLoadedState prefs(SharedPreferences prefs) => this(prefs: prefs);

  @override
  GameLoadedState round(int round) => this(round: round);

  @override
  GameLoadedState foldTotal(int foldTotal) => this(foldTotal: foldTotal);

  @override
  GameLoadedState turn(int turn) => this(turn: turn);

  @override
  GameLoadedState roundDirection(RoundDirection roundDirection) =>
      this(roundDirection: roundDirection);

  @override
  GameLoadedState gameStep(GameStep gameStep) => this(gameStep: gameStep);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? prefs = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
    Object? foldTotal = const $CopyWithPlaceholder(),
    Object? turn = const $CopyWithPlaceholder(),
    Object? roundDirection = const $CopyWithPlaceholder(),
    Object? gameStep = const $CopyWithPlaceholder(),
  }) {
    return GameLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      prefs: prefs == const $CopyWithPlaceholder() || prefs == null
          ? _value.prefs
          // ignore: cast_nullable_to_non_nullable
          : prefs as SharedPreferences,
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
      roundDirection: roundDirection == const $CopyWithPlaceholder() ||
              roundDirection == null
          ? _value.roundDirection
          // ignore: cast_nullable_to_non_nullable
          : roundDirection as RoundDirection,
      gameStep: gameStep == const $CopyWithPlaceholder() || gameStep == null
          ? _value.gameStep
          // ignore: cast_nullable_to_non_nullable
          : gameStep as GameStep,
    );
  }
}

extension $GameLoadedStateCopyWith on GameLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfGameLoadedState.copyWith(...)` or like so:`instanceOfGameLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameLoadedStateCWProxy get copyWith => _$GameLoadedStateCWProxyImpl(this);
}
