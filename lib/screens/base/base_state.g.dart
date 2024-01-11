// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseLoadedStateCWProxy {
  BaseLoadedState prefs(SharedPreferences prefs);

  BaseLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    SharedPreferences? prefs,
    List<PlayerModel>? listOfPlayers,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseLoadedState.copyWith.fieldName(...)`
class _$BaseLoadedStateCWProxyImpl implements _$BaseLoadedStateCWProxy {
  const _$BaseLoadedStateCWProxyImpl(this._value);

  final BaseLoadedState _value;

  @override
  BaseLoadedState prefs(SharedPreferences prefs) => this(prefs: prefs);

  @override
  BaseLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    Object? prefs = const $CopyWithPlaceholder(),
    Object? listOfPlayers = const $CopyWithPlaceholder(),
  }) {
    return BaseLoadedState(
      prefs: prefs == const $CopyWithPlaceholder() || prefs == null
          ? _value.prefs
          // ignore: cast_nullable_to_non_nullable
          : prefs as SharedPreferences,
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
    );
  }
}

extension $BaseLoadedStateCopyWith on BaseLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfBaseLoadedState.copyWith(...)` or like so:`instanceOfBaseLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseLoadedStateCWProxy get copyWith => _$BaseLoadedStateCWProxyImpl(this);
}
