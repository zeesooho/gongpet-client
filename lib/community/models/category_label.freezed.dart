// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryLabel _$CategoryLabelFromJson(Map<String, dynamic> json) {
  return _CategoryLabel.fromJson(json);
}

/// @nodoc
mixin _$CategoryLabel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CategoryLabel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryLabelCopyWith<CategoryLabel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLabelCopyWith<$Res> {
  factory $CategoryLabelCopyWith(
          CategoryLabel value, $Res Function(CategoryLabel) then) =
      _$CategoryLabelCopyWithImpl<$Res, CategoryLabel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$CategoryLabelCopyWithImpl<$Res, $Val extends CategoryLabel>
    implements $CategoryLabelCopyWith<$Res> {
  _$CategoryLabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryLabelImplCopyWith<$Res>
    implements $CategoryLabelCopyWith<$Res> {
  factory _$$CategoryLabelImplCopyWith(
          _$CategoryLabelImpl value, $Res Function(_$CategoryLabelImpl) then) =
      __$$CategoryLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$CategoryLabelImplCopyWithImpl<$Res>
    extends _$CategoryLabelCopyWithImpl<$Res, _$CategoryLabelImpl>
    implements _$$CategoryLabelImplCopyWith<$Res> {
  __$$CategoryLabelImplCopyWithImpl(
      _$CategoryLabelImpl _value, $Res Function(_$CategoryLabelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryLabel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$CategoryLabelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryLabelImpl implements _CategoryLabel {
  _$CategoryLabelImpl({required this.id, required this.name});

  factory _$CategoryLabelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryLabelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'CategoryLabel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryLabelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of CategoryLabel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryLabelImplCopyWith<_$CategoryLabelImpl> get copyWith =>
      __$$CategoryLabelImplCopyWithImpl<_$CategoryLabelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryLabelImplToJson(
      this,
    );
  }
}

abstract class _CategoryLabel implements CategoryLabel {
  factory _CategoryLabel({required final int id, required final String name}) =
      _$CategoryLabelImpl;

  factory _CategoryLabel.fromJson(Map<String, dynamic> json) =
      _$CategoryLabelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of CategoryLabel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryLabelImplCopyWith<_$CategoryLabelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
