// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostCategory _$PostCategoryFromJson(Map<String, dynamic> json) {
  return _PostCategory.fromJson(json);
}

/// @nodoc
mixin _$PostCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get abbreviation => throw _privateConstructorUsedError;
  bool get hasLabel => throw _privateConstructorUsedError;
  List<CategoryLabel> get labels => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this PostCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCategoryCopyWith<PostCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCategoryCopyWith<$Res> {
  factory $PostCategoryCopyWith(
          PostCategory value, $Res Function(PostCategory) then) =
      _$PostCategoryCopyWithImpl<$Res, PostCategory>;
  @useResult
  $Res call(
      {int id,
      String name,
      String abbreviation,
      bool hasLabel,
      List<CategoryLabel> labels,
      String description});
}

/// @nodoc
class _$PostCategoryCopyWithImpl<$Res, $Val extends PostCategory>
    implements $PostCategoryCopyWith<$Res> {
  _$PostCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? abbreviation = null,
    Object? hasLabel = null,
    Object? labels = null,
    Object? description = null,
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
      abbreviation: null == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      hasLabel: null == hasLabel
          ? _value.hasLabel
          : hasLabel // ignore: cast_nullable_to_non_nullable
              as bool,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<CategoryLabel>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostCategoryImplCopyWith<$Res>
    implements $PostCategoryCopyWith<$Res> {
  factory _$$PostCategoryImplCopyWith(
          _$PostCategoryImpl value, $Res Function(_$PostCategoryImpl) then) =
      __$$PostCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String abbreviation,
      bool hasLabel,
      List<CategoryLabel> labels,
      String description});
}

/// @nodoc
class __$$PostCategoryImplCopyWithImpl<$Res>
    extends _$PostCategoryCopyWithImpl<$Res, _$PostCategoryImpl>
    implements _$$PostCategoryImplCopyWith<$Res> {
  __$$PostCategoryImplCopyWithImpl(
      _$PostCategoryImpl _value, $Res Function(_$PostCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? abbreviation = null,
    Object? hasLabel = null,
    Object? labels = null,
    Object? description = null,
  }) {
    return _then(_$PostCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abbreviation: null == abbreviation
          ? _value.abbreviation
          : abbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      hasLabel: null == hasLabel
          ? _value.hasLabel
          : hasLabel // ignore: cast_nullable_to_non_nullable
              as bool,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<CategoryLabel>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostCategoryImpl implements _PostCategory {
  _$PostCategoryImpl(
      {required this.id,
      required this.name,
      required this.abbreviation,
      required this.hasLabel,
      required final List<CategoryLabel> labels,
      required this.description})
      : _labels = labels;

  factory _$PostCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostCategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String abbreviation;
  @override
  final bool hasLabel;
  final List<CategoryLabel> _labels;
  @override
  List<CategoryLabel> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  final String description;

  @override
  String toString() {
    return 'PostCategory(id: $id, name: $name, abbreviation: $abbreviation, hasLabel: $hasLabel, labels: $labels, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.abbreviation, abbreviation) ||
                other.abbreviation == abbreviation) &&
            (identical(other.hasLabel, hasLabel) ||
                other.hasLabel == hasLabel) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, abbreviation, hasLabel,
      const DeepCollectionEquality().hash(_labels), description);

  /// Create a copy of PostCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCategoryImplCopyWith<_$PostCategoryImpl> get copyWith =>
      __$$PostCategoryImplCopyWithImpl<_$PostCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostCategoryImplToJson(
      this,
    );
  }
}

abstract class _PostCategory implements PostCategory {
  factory _PostCategory(
      {required final int id,
      required final String name,
      required final String abbreviation,
      required final bool hasLabel,
      required final List<CategoryLabel> labels,
      required final String description}) = _$PostCategoryImpl;

  factory _PostCategory.fromJson(Map<String, dynamic> json) =
      _$PostCategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get abbreviation;
  @override
  bool get hasLabel;
  @override
  List<CategoryLabel> get labels;
  @override
  String get description;

  /// Create a copy of PostCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCategoryImplCopyWith<_$PostCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
