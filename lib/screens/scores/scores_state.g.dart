// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scores_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScoresLoadedStateCWProxy {
  ScoresLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  ScoresLoadedState round(int round);

  ScoresLoadedState selectedUser(int selectedUser);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScoresLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScoresLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  ScoresLoadedState call({
    List<PlayerModel>? listOfPlayers,
    int? round,
    int? selectedUser,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScoresLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScoresLoadedState.copyWith.fieldName(...)`
class _$ScoresLoadedStateCWProxyImpl implements _$ScoresLoadedStateCWProxy {
  const _$ScoresLoadedStateCWProxyImpl(this._value);

  final ScoresLoadedState _value;

  @override
  ScoresLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  ScoresLoadedState round(int round) => this(round: round);

  @override
  ScoresLoadedState selectedUser(int selectedUser) =>
      this(selectedUser: selectedUser);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScoresLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScoresLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  ScoresLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
    Object? selectedUser = const $CopyWithPlaceholder(),
  }) {
    return ScoresLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      round: round == const $CopyWithPlaceholder() || round == null
          ? _value.round
          // ignore: cast_nullable_to_non_nullable
          : round as int,
      selectedUser:
          selectedUser == const $CopyWithPlaceholder() || selectedUser == null
              ? _value.selectedUser
              // ignore: cast_nullable_to_non_nullable
              : selectedUser as int,
    );
  }
}

extension $ScoresLoadedStateCopyWith on ScoresLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfScoresLoadedState.copyWith(...)` or like so:`instanceOfScoresLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScoresLoadedStateCWProxy get copyWith =>
      _$ScoresLoadedStateCWProxyImpl(this);
}
