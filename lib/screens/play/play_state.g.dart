// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayLoadedStateCWProxy {
  PlayLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  PlayLoadedState prefs(SharedPreferences prefs);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayLoadedState call({
    List<PlayerModel>? listOfPlayers,
    SharedPreferences? prefs,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayLoadedState.copyWith.fieldName(...)`
class _$PlayLoadedStateCWProxyImpl implements _$PlayLoadedStateCWProxy {
  const _$PlayLoadedStateCWProxyImpl(this._value);

  final PlayLoadedState _value;

  @override
  PlayLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  PlayLoadedState prefs(SharedPreferences prefs) => this(prefs: prefs);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? prefs = const $CopyWithPlaceholder(),
  }) {
    return PlayLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      prefs: prefs == const $CopyWithPlaceholder() || prefs == null
          ? _value.prefs
          // ignore: cast_nullable_to_non_nullable
          : prefs as SharedPreferences,
    );
  }
}

extension $PlayLoadedStateCopyWith on PlayLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfPlayLoadedState.copyWith(...)` or like so:`instanceOfPlayLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayLoadedStateCWProxy get copyWith => _$PlayLoadedStateCWProxyImpl(this);
}
