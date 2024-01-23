// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_players_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddPlayersLoadedStateCWProxy {
  AddPlayersLoadedState listOfPlayers(List<PlayerModel> listOfPlayers);

  AddPlayersLoadedState controller(TextEditingController controller);

  AddPlayersLoadedState round(int round);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddPlayersLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddPlayersLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddPlayersLoadedState call({
    List<PlayerModel>? listOfPlayers,
    TextEditingController? controller,
    int? round,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddPlayersLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddPlayersLoadedState.copyWith.fieldName(...)`
class _$AddPlayersLoadedStateCWProxyImpl
    implements _$AddPlayersLoadedStateCWProxy {
  const _$AddPlayersLoadedStateCWProxyImpl(this._value);

  final AddPlayersLoadedState _value;

  @override
  AddPlayersLoadedState listOfPlayers(List<PlayerModel> listOfPlayers) =>
      this(listOfPlayers: listOfPlayers);

  @override
  AddPlayersLoadedState controller(TextEditingController controller) =>
      this(controller: controller);

  @override
  AddPlayersLoadedState round(int round) => this(round: round);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddPlayersLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddPlayersLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddPlayersLoadedState call({
    Object? listOfPlayers = const $CopyWithPlaceholder(),
    Object? controller = const $CopyWithPlaceholder(),
    Object? round = const $CopyWithPlaceholder(),
  }) {
    return AddPlayersLoadedState(
      listOfPlayers:
          listOfPlayers == const $CopyWithPlaceholder() || listOfPlayers == null
              ? _value.listOfPlayers
              // ignore: cast_nullable_to_non_nullable
              : listOfPlayers as List<PlayerModel>,
      controller:
          controller == const $CopyWithPlaceholder() || controller == null
              ? _value.controller
              // ignore: cast_nullable_to_non_nullable
              : controller as TextEditingController,
      round: round == const $CopyWithPlaceholder() || round == null
          ? _value.round
          // ignore: cast_nullable_to_non_nullable
          : round as int,
    );
  }
}

extension $AddPlayersLoadedStateCopyWith on AddPlayersLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfAddPlayersLoadedState.copyWith(...)` or like so:`instanceOfAddPlayersLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddPlayersLoadedStateCWProxy get copyWith =>
      _$AddPlayersLoadedStateCWProxyImpl(this);
}
