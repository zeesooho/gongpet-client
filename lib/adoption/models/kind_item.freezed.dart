// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kind_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KindItem _$KindItemFromJson(Map<String, dynamic> json) {
  return _KindItem.fromJson(json);
}

/// @nodoc
mixin _$KindItem {
  String get kindCd => throw _privateConstructorUsedError;
  String get knm => throw _privateConstructorUsedError;

  /// Serializes this KindItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KindItemCopyWith<KindItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KindItemCopyWith<$Res> {
  factory $KindItemCopyWith(KindItem value, $Res Function(KindItem) then) =
      _$KindItemCopyWithImpl<$Res, KindItem>;
  @useResult
  $Res call({String kindCd, String knm});
}

/// @nodoc
class _$KindItemCopyWithImpl<$Res, $Val extends KindItem>
    implements $KindItemCopyWith<$Res> {
  _$KindItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kindCd = null,
    Object? knm = null,
  }) {
    return _then(_value.copyWith(
      kindCd: null == kindCd
          ? _value.kindCd
          : kindCd // ignore: cast_nullable_to_non_nullable
              as String,
      knm: null == knm
          ? _value.knm
          : knm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KindItemImplCopyWith<$Res>
    implements $KindItemCopyWith<$Res> {
  factory _$$KindItemImplCopyWith(
          _$KindItemImpl value, $Res Function(_$KindItemImpl) then) =
      __$$KindItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String kindCd, String knm});
}

/// @nodoc
class __$$KindItemImplCopyWithImpl<$Res>
    extends _$KindItemCopyWithImpl<$Res, _$KindItemImpl>
    implements _$$KindItemImplCopyWith<$Res> {
  __$$KindItemImplCopyWithImpl(
      _$KindItemImpl _value, $Res Function(_$KindItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kindCd = null,
    Object? knm = null,
  }) {
    return _then(_$KindItemImpl(
      kindCd: null == kindCd
          ? _value.kindCd
          : kindCd // ignore: cast_nullable_to_non_nullable
              as String,
      knm: null == knm
          ? _value.knm
          : knm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KindItemImpl implements _KindItem {
  _$KindItemImpl({required this.kindCd, required this.knm});

  factory _$KindItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$KindItemImplFromJson(json);

  @override
  final String kindCd;
  @override
  final String knm;

  @override
  String toString() {
    return 'KindItem(kindCd: $kindCd, knm: $knm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KindItemImpl &&
            (identical(other.kindCd, kindCd) || other.kindCd == kindCd) &&
            (identical(other.knm, knm) || other.knm == knm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kindCd, knm);

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KindItemImplCopyWith<_$KindItemImpl> get copyWith =>
      __$$KindItemImplCopyWithImpl<_$KindItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KindItemImplToJson(
      this,
    );
  }
}

abstract class _KindItem implements KindItem {
  factory _KindItem({required final String kindCd, required final String knm}) =
      _$KindItemImpl;

  factory _KindItem.fromJson(Map<String, dynamic> json) =
      _$KindItemImpl.fromJson;

  @override
  String get kindCd;
  @override
  String get knm;

  /// Create a copy of KindItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KindItemImplCopyWith<_$KindItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
