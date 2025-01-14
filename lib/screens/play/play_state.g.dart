// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlayLoadedStateCWProxy {
  PlayLoadedState foldDelta(int foldDelta);

  PlayLoadedState firstPlayerName(String firstPlayerName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayLoadedState call({
    int? foldDelta,
    String? firstPlayerName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlayLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlayLoadedState.copyWith.fieldName(...)`
class _$PlayLoadedStateCWProxyImpl implements _$PlayLoadedStateCWProxy {
  const _$PlayLoadedStateCWProxyImpl(this._value);

  final PlayLoadedState _value;

  @override
  PlayLoadedState foldDelta(int foldDelta) => this(foldDelta: foldDelta);

  @override
  PlayLoadedState firstPlayerName(String firstPlayerName) =>
      this(firstPlayerName: firstPlayerName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PlayLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PlayLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  PlayLoadedState call({
    Object? foldDelta = const $CopyWithPlaceholder(),
    Object? firstPlayerName = const $CopyWithPlaceholder(),
  }) {
    return PlayLoadedState(
      foldDelta: foldDelta == const $CopyWithPlaceholder() || foldDelta == null
          ? _value.foldDelta
          // ignore: cast_nullable_to_non_nullable
          : foldDelta as int,
      firstPlayerName: firstPlayerName == const $CopyWithPlaceholder() ||
              firstPlayerName == null
          ? _value.firstPlayerName
          // ignore: cast_nullable_to_non_nullable
          : firstPlayerName as String,
    );
  }
}

extension $PlayLoadedStateCopyWith on PlayLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfPlayLoadedState.copyWith(...)` or like so:`instanceOfPlayLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlayLoadedStateCWProxy get copyWith => _$PlayLoadedStateCWProxyImpl(this);
}
