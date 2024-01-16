// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scores_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScoresLoadedStateCWProxy {
  ScoresLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScoresLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScoresLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  ScoresLoadedState call({
    List<PlayerModel>? listOfPlayers,
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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScoresLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScoresLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  ScoresLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
  }) {
    return ScoresLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
    );
  }
}

extension $ScoresLoadedStateCopyWith on ScoresLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfScoresLoadedState.copyWith(...)` or like so:`instanceOfScoresLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScoresLoadedStateCWProxy get copyWith =>
      _$ScoresLoadedStateCWProxyImpl(this);
}
