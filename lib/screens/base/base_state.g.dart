// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseLoadedStateCWProxy {
  BaseLoadedState meta(MetaModel meta);

  BaseLoadedState prefs(SharedPreferences prefs);

  BaseLoadedState games(List<GameModel> games);

  BaseLoadedState selectedGameIndex(int selectedGameIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    MetaModel? meta,
    SharedPreferences? prefs,
    List<GameModel>? games,
    int? selectedGameIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseLoadedState.copyWith.fieldName(...)`
class _$BaseLoadedStateCWProxyImpl implements _$BaseLoadedStateCWProxy {
  const _$BaseLoadedStateCWProxyImpl(this._value);

  final BaseLoadedState _value;

  @override
  BaseLoadedState meta(MetaModel meta) => this(meta: meta);

  @override
  BaseLoadedState prefs(SharedPreferences prefs) => this(prefs: prefs);

  @override
  BaseLoadedState games(List<GameModel> games) => this(games: games);

  @override
  BaseLoadedState selectedGameIndex(int selectedGameIndex) =>
      this(selectedGameIndex: selectedGameIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    Object? meta = const $CopyWithPlaceholder(),
    Object? prefs = const $CopyWithPlaceholder(),
    Object? games = const $CopyWithPlaceholder(),
    Object? selectedGameIndex = const $CopyWithPlaceholder(),
  }) {
    return BaseLoadedState(
      meta: meta == const $CopyWithPlaceholder() || meta == null
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as MetaModel,
      prefs: prefs == const $CopyWithPlaceholder() || prefs == null
          ? _value.prefs
          // ignore: cast_nullable_to_non_nullable
          : prefs as SharedPreferences,
      games: games == const $CopyWithPlaceholder() || games == null
          ? _value.games
          // ignore: cast_nullable_to_non_nullable
          : games as List<GameModel>,
      selectedGameIndex: selectedGameIndex == const $CopyWithPlaceholder() ||
              selectedGameIndex == null
          ? _value.selectedGameIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedGameIndex as int,
    );
  }
}

extension $BaseLoadedStateCopyWith on BaseLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfBaseLoadedState.copyWith(...)` or like so:`instanceOfBaseLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseLoadedStateCWProxy get copyWith => _$BaseLoadedStateCWProxyImpl(this);
}
