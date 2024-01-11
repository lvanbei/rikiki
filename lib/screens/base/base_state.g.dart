// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseLoadedStateCWProxy {
  BaseLoadedState prefs(SharedPreferences prefs);

  BaseLoadedState initialListOfPlayers(List<PlayerModel> initialListOfPlayers);

  BaseLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  BaseLoadedState round(int round);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    SharedPreferences? prefs,
    List<PlayerModel>? initialListOfPlayers,
    List<PlayerModel>? listOfPlayers,
    int? round,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseLoadedState.copyWith.fieldName(...)`
class _$BaseLoadedStateCWProxyImpl implements _$BaseLoadedStateCWProxy {
  const _$BaseLoadedStateCWProxyImpl(this._value);

  final BaseLoadedState _value;

  @override
  BaseLoadedState prefs(SharedPreferences prefs) => this(prefs: prefs);

  @override
  BaseLoadedState initialListOfPlayers(
          List<PlayerModel> initialListOfPlayers) =>
      this(initialListOfPlayers: initialListOfPlayers);

  @override
  BaseLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  BaseLoadedState round(int round) => this(round: round);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    Object? prefs = const $CopyWithPlaceholder(),
    Object? initialListOfPlayers = const $CopyWithPlaceholder(),
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
  }) {
    return BaseLoadedState(
      prefs: prefs == const $CopyWithPlaceholder() || prefs == null
          ? _value.prefs
          // ignore: cast_nullable_to_non_nullable
          : prefs as SharedPreferences,
      initialListOfPlayers:
          initialListOfPlayers == const $CopyWithPlaceholder() ||
                  initialListOfPlayers == null
              ? _value.initialListOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : initialListOfPlayers as List<PlayerModel>,
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      round: round == const $CopyWithPlaceholder() || round == null
          ? _value.round
          // ignore: cast_nullable_to_non_nullable
          : round as int,
    );
  }
}

extension $BaseLoadedStateCopyWith on BaseLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfBaseLoadedState.copyWith(...)` or like so:`instanceOfBaseLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseLoadedStateCWProxy get copyWith => _$BaseLoadedStateCWProxyImpl(this);
}
