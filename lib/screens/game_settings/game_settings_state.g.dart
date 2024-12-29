// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_settings_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GameSettingsLoadedStateCWProxy {
  GameSettingsLoadedState rounds(int rounds);

  GameSettingsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  GameSettingsLoadedState pointsPerFold(int pointsPerFold);

  GameSettingsLoadedState increasePointPerFold(bool increasePointPerFold);

  GameSettingsLoadedState round(int round);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameSettingsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameSettingsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameSettingsLoadedState call({
    int? rounds,
    List<PlayerModel>? listOfPlayers,
    int? pointsPerFold,
    bool? increasePointPerFold,
    int? round,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGameSettingsLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGameSettingsLoadedState.copyWith.fieldName(...)`
class _$GameSettingsLoadedStateCWProxyImpl
    implements _$GameSettingsLoadedStateCWProxy {
  const _$GameSettingsLoadedStateCWProxyImpl(this._value);

  final GameSettingsLoadedState _value;

  @override
  GameSettingsLoadedState rounds(int rounds) => this(rounds: rounds);

  @override
  GameSettingsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  GameSettingsLoadedState pointsPerFold(int pointsPerFold) =>
      this(pointsPerFold: pointsPerFold);

  @override
  GameSettingsLoadedState increasePointPerFold(bool increasePointPerFold) =>
      this(increasePointPerFold: increasePointPerFold);

  @override
  GameSettingsLoadedState round(int round) => this(round: round);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GameSettingsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GameSettingsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  GameSettingsLoadedState call({
    Object? rounds = const $CopyWithPlaceholder(),
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? pointsPerFold = const $CopyWithPlaceholder(),
    Object? increasePointPerFold = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
  }) {
    return GameSettingsLoadedState(
      rounds: rounds == const $CopyWithPlaceholder() || rounds == null
          ? _value.rounds
          // ignore: cast_nullable_to_non_nullable
          : rounds as int,
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      pointsPerFold:
          pointsPerFold == const $CopyWithPlaceholder() || pointsPerFold == null
              ? _value.pointsPerFold
              // ignore: cast_nullable_to_non_nullable
              : pointsPerFold as int,
      increasePointPerFold:
          increasePointPerFold == const $CopyWithPlaceholder() ||
                  increasePointPerFold == null
              ? _value.increasePointPerFold
              // ignore: cast_nullable_to_non_nullable
              : increasePointPerFold as bool,
      round: round == const $CopyWithPlaceholder() || round == null
          ? _value.round
          // ignore: cast_nullable_to_non_nullable
          : round as int,
    );
  }
}

extension $GameSettingsLoadedStateCopyWith on GameSettingsLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfGameSettingsLoadedState.copyWith(...)` or like so:`instanceOfGameSettingsLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GameSettingsLoadedStateCWProxy get copyWith =>
      _$GameSettingsLoadedStateCWProxyImpl(this);
}
