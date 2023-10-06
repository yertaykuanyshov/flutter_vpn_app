// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vpn_server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VpnServer _$VpnServerFromJson(Map<String, dynamic> json) {
  return _VpnServer.fromJson(json);
}

/// @nodoc
mixin _$VpnServer {
  String get name => throw _privateConstructorUsedError;
  String get config => throw _privateConstructorUsedError;
  bool get isFree => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VpnServerCopyWith<VpnServer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VpnServerCopyWith<$Res> {
  factory $VpnServerCopyWith(VpnServer value, $Res Function(VpnServer) then) =
      _$VpnServerCopyWithImpl<$Res, VpnServer>;
  @useResult
  $Res call({String name, String config, bool isFree, bool isAvailable});
}

/// @nodoc
class _$VpnServerCopyWithImpl<$Res, $Val extends VpnServer>
    implements $VpnServerCopyWith<$Res> {
  _$VpnServerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? config = null,
    Object? isFree = null,
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as String,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VpnServerImplCopyWith<$Res>
    implements $VpnServerCopyWith<$Res> {
  factory _$$VpnServerImplCopyWith(
          _$VpnServerImpl value, $Res Function(_$VpnServerImpl) then) =
      __$$VpnServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String config, bool isFree, bool isAvailable});
}

/// @nodoc
class __$$VpnServerImplCopyWithImpl<$Res>
    extends _$VpnServerCopyWithImpl<$Res, _$VpnServerImpl>
    implements _$$VpnServerImplCopyWith<$Res> {
  __$$VpnServerImplCopyWithImpl(
      _$VpnServerImpl _value, $Res Function(_$VpnServerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? config = null,
    Object? isFree = null,
    Object? isAvailable = null,
  }) {
    return _then(_$VpnServerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as String,
      isFree: null == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VpnServerImpl implements _VpnServer {
  const _$VpnServerImpl(
      {required this.name,
      required this.config,
      required this.isFree,
      required this.isAvailable});

  factory _$VpnServerImpl.fromJson(Map<String, dynamic> json) =>
      _$$VpnServerImplFromJson(json);

  @override
  final String name;
  @override
  final String config;
  @override
  final bool isFree;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'VpnServer(name: $name, config: $config, isFree: $isFree, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VpnServerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, config, isFree, isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VpnServerImplCopyWith<_$VpnServerImpl> get copyWith =>
      __$$VpnServerImplCopyWithImpl<_$VpnServerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VpnServerImplToJson(
      this,
    );
  }
}

abstract class _VpnServer implements VpnServer {
  const factory _VpnServer(
      {required final String name,
      required final String config,
      required final bool isFree,
      required final bool isAvailable}) = _$VpnServerImpl;

  factory _VpnServer.fromJson(Map<String, dynamic> json) =
      _$VpnServerImpl.fromJson;

  @override
  String get name;
  @override
  String get config;
  @override
  bool get isFree;
  @override
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$VpnServerImplCopyWith<_$VpnServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
