// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sido_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SidoItem _$SidoItemFromJson(Map<String, dynamic> json) {
  return _SidoItem.fromJson(json);
}

/// @nodoc
mixin _$SidoItem {
  String get orgCd => throw _privateConstructorUsedError;
  String get orgdownNm => throw _privateConstructorUsedError;

  /// Serializes this SidoItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidoItemCopyWith<SidoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidoItemCopyWith<$Res> {
  factory $SidoItemCopyWith(SidoItem value, $Res Function(SidoItem) then) =
      _$SidoItemCopyWithImpl<$Res, SidoItem>;
  @useResult
  $Res call({String orgCd, String orgdownNm});
}

/// @nodoc
class _$SidoItemCopyWithImpl<$Res, $Val extends SidoItem>
    implements $SidoItemCopyWith<$Res> {
  _$SidoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgCd = null,
    Object? orgdownNm = null,
  }) {
    return _then(_value.copyWith(
      orgCd: null == orgCd
          ? _value.orgCd
          : orgCd // ignore: cast_nullable_to_non_nullable
              as String,
      orgdownNm: null == orgdownNm
          ? _value.orgdownNm
          : orgdownNm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SidoItemImplCopyWith<$Res>
    implements $SidoItemCopyWith<$Res> {
  factory _$$SidoItemImplCopyWith(
          _$SidoItemImpl value, $Res Function(_$SidoItemImpl) then) =
      __$$SidoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orgCd, String orgdownNm});
}

/// @nodoc
class __$$SidoItemImplCopyWithImpl<$Res>
    extends _$SidoItemCopyWithImpl<$Res, _$SidoItemImpl>
    implements _$$SidoItemImplCopyWith<$Res> {
  __$$SidoItemImplCopyWithImpl(
      _$SidoItemImpl _value, $Res Function(_$SidoItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgCd = null,
    Object? orgdownNm = null,
  }) {
    return _then(_$SidoItemImpl(
      orgCd: null == orgCd
          ? _value.orgCd
          : orgCd // ignore: cast_nullable_to_non_nullable
              as String,
      orgdownNm: null == orgdownNm
          ? _value.orgdownNm
          : orgdownNm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SidoItemImpl implements _SidoItem {
  _$SidoItemImpl({required this.orgCd, required this.orgdownNm});

  factory _$SidoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SidoItemImplFromJson(json);

  @override
  final String orgCd;
  @override
  final String orgdownNm;

  @override
  String toString() {
    return 'SidoItem(orgCd: $orgCd, orgdownNm: $orgdownNm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidoItemImpl &&
            (identical(other.orgCd, orgCd) || other.orgCd == orgCd) &&
            (identical(other.orgdownNm, orgdownNm) ||
                other.orgdownNm == orgdownNm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, orgCd, orgdownNm);

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidoItemImplCopyWith<_$SidoItemImpl> get copyWith =>
      __$$SidoItemImplCopyWithImpl<_$SidoItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SidoItemImplToJson(
      this,
    );
  }
}

abstract class _SidoItem implements SidoItem {
  factory _SidoItem(
      {required final String orgCd,
      required final String orgdownNm}) = _$SidoItemImpl;

  factory _SidoItem.fromJson(Map<String, dynamic> json) =
      _$SidoItemImpl.fromJson;

  @override
  String get orgCd;
  @override
  String get orgdownNm;

  /// Create a copy of SidoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidoItemImplCopyWith<_$SidoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}