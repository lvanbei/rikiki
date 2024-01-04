// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseLoadedStateCWProxy {
  BaseLoadedState isHome(bool isHome);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    bool? isHome,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseLoadedState.copyWith.fieldName(...)`
class _$BaseLoadedStateCWProxyImpl implements _$BaseLoadedStateCWProxy {
  const _$BaseLoadedStateCWProxyImpl(this._value);

  final BaseLoadedState _value;

  @override
  BaseLoadedState isHome(bool isHome) => this(isHome: isHome);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseLoadedState call({
    Object? isHome = const $CopyWithPlaceholder(),
  }) {
    return BaseLoadedState(
      isHome: isHome == const $CopyWithPlaceholder() || isHome == null
          ? _value.isHome
          // ignore: cast_nullable_to_non_nullable
          : isHome as bool,
    );
  }
}

extension $BaseLoadedStateCopyWith on BaseLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfBaseLoadedState.copyWith(...)` or like so:`instanceOfBaseLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseLoadedStateCWProxy get copyWith => _$BaseLoadedStateCWProxyImpl(this);
}
