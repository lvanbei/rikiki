// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_game_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SelectGameLoadedStateCWProxy {
  SelectGameLoadedState games(List<GameModel> games);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectGameLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectGameLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectGameLoadedState call({
    List<GameModel>? games,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSelectGameLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSelectGameLoadedState.copyWith.fieldName(...)`
class _$SelectGameLoadedStateCWProxyImpl
    implements _$SelectGameLoadedStateCWProxy {
  const _$SelectGameLoadedStateCWProxyImpl(this._value);

  final SelectGameLoadedState _value;

  @override
  SelectGameLoadedState games(List<GameModel> games) => this(games: games);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SelectGameLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SelectGameLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  SelectGameLoadedState call({
    Object? games = const $CopyWithPlaceholder(),
  }) {
    return SelectGameLoadedState(
      games: games == const $CopyWithPlaceholder() || games == null
          ? _value.games
          // ignore: cast_nullable_to_non_nullable
          : games as List<GameModel>,
    );
  }
}

extension $SelectGameLoadedStateCopyWith on SelectGameLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfSelectGameLoadedState.copyWith(...)` or like so:`instanceOfSelectGameLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SelectGameLoadedStateCWProxy get copyWith =>
      _$SelectGameLoadedStateCWProxyImpl(this);
}
