// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_folds_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CheckFoldsLoadedStateCWProxy {
  CheckFoldsLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  CheckFoldsLoadedState round(int round);

  CheckFoldsLoadedState rounds(int rounds);

  CheckFoldsLoadedState turn(int turn);

  CheckFoldsLoadedState displayedFold(int displayedFold);

  CheckFoldsLoadedState pointPerFold(int pointPerFold);

  CheckFoldsLoadedState increasePointPerFold(bool increasePointPerFold);

  CheckFoldsLoadedState totalCheckedFolds(int totalCheckedFolds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CheckFoldsLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CheckFoldsLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  CheckFoldsLoadedState call({
    List<PlayerModel>? listOfPlayers,
    int? round,
    int? rounds,
    int? turn,
    int? displayedFold,
    int? pointPerFold,
    bool? increasePointPerFold,
    int? totalCheckedFolds,
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
  CheckFoldsLoadedState rounds(int rounds) => this(rounds: rounds);

  @override
  CheckFoldsLoadedState turn(int turn) => this(turn: turn);

  @override
  CheckFoldsLoadedState displayedFold(int displayedFold) =>
      this(displayedFold: displayedFold);

  @override
  CheckFoldsLoadedState pointPerFold(int pointPerFold) =>
      this(pointPerFold: pointPerFold);

  @override
  CheckFoldsLoadedState increasePointPerFold(bool increasePointPerFold) =>
      this(increasePointPerFold: increasePointPerFold);

  @override
  CheckFoldsLoadedState totalCheckedFolds(int totalCheckedFolds) =>
      this(totalCheckedFolds: totalCheckedFolds);

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
    Object? rounds = const $CopyWithPlaceholder(),
    Object? turn = const $CopyWithPlaceholder(),
    Object? displayedFold = const $CopyWithPlaceholder(),
    Object? pointPerFold = const $CopyWithPlaceholder(),
    Object? increasePointPerFold = const $CopyWithPlaceholder(),
    Object? totalCheckedFolds = const $CopyWithPlaceholder(),
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
      rounds: rounds == const $CopyWithPlaceholder() || rounds == null
          ? _value.rounds
          // ignore: cast_nullable_to_non_nullable
          : rounds as int,
      turn: turn == const $CopyWithPlaceholder() || turn == null
          ? _value.turn
          // ignore: cast_nullable_to_non_nullable
          : turn as int,
      displayedFold:
          displayedFold == const $CopyWithPlaceholder() || displayedFold == null
              ? _value.displayedFold
              // ignore: cast_nullable_to_non_nullable
              : displayedFold as int,
      pointPerFold:
          pointPerFold == const $CopyWithPlaceholder() || pointPerFold == null
              ? _value.pointPerFold
              // ignore: cast_nullable_to_non_nullable
              : pointPerFold as int,
      increasePointPerFold:
          increasePointPerFold == const $CopyWithPlaceholder() ||
                  increasePointPerFold == null
              ? _value.increasePointPerFold
              // ignore: cast_nullable_to_non_nullable
              : increasePointPerFold as bool,
      totalCheckedFolds: totalCheckedFolds == const $CopyWithPlaceholder() ||
              totalCheckedFolds == null
          ? _value.totalCheckedFolds
          // ignore: cast_nullable_to_non_nullable
          : totalCheckedFolds as int,
    );
  }
}

extension $CheckFoldsLoadedStateCopyWith on CheckFoldsLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfCheckFoldsLoadedState.copyWith(...)` or like so:`instanceOfCheckFoldsLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CheckFoldsLoadedStateCWProxy get copyWith =>
      _$CheckFoldsLoadedStateCWProxyImpl(this);
}
