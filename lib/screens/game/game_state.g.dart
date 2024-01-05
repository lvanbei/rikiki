// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameLoadedStateCWProxy {
  GameLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  GameLoadedState prefs(SharedPreferences prefs);

  GameLoadedState round(int round);

  GameLoadedState fold(int fold);

  GameLoadedState turn(int turn);

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
    int? fold,
    int? turn,
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
  GameLoadedState fold(int fold) => this(fold: fold);

  @override
  GameLoadedState turn(int turn) => this(turn: turn);

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
    Object? fold = const $CopyWithPlaceholder(),
    Object? turn = const $CopyWithPlaceholder(),
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
      fold: fold == const $CopyWithPlaceholder() || fold == null
          ? _value.fold
          // ignore: cast_nullable_to_non_nullable
          : fold as int,
      turn: turn == const $CopyWithPlaceholder() || turn == null
          ? _value.turn
          // ignore: cast_nullable_to_non_nullable
          : turn as int,
    );
  }
}

extension $GameLoadedStateCopyWith on GameLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfGameLoadedState.copyWith(...)` or like so:`instanceOfGameLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameLoadedStateCWProxy get copyWith => _$GameLoadedStateCWProxyImpl(this);
}
