// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostMeta _$PostMetaFromJson(Map<String, dynamic> json) {
  return _PostMeta.fromJson(json);
}

/// @nodoc
mixin _$PostMeta {
  int get views => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this PostMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostMetaCopyWith<PostMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostMetaCopyWith<$Res> {
  factory $PostMetaCopyWith(PostMeta value, $Res Function(PostMeta) then) =
      _$PostMetaCopyWithImpl<$Res, PostMeta>;
  @useResult
  $Res call({int views, int likes, int commentsCount});
}

/// @nodoc
class _$PostMetaCopyWithImpl<$Res, $Val extends PostMeta>
    implements $PostMetaCopyWith<$Res> {
  _$PostMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? views = null,
    Object? likes = null,
    Object? commentsCount = null,
  }) {
    return _then(_value.copyWith(
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostMetaImplCopyWith<$Res>
    implements $PostMetaCopyWith<$Res> {
  factory _$$PostMetaImplCopyWith(
          _$PostMetaImpl value, $Res Function(_$PostMetaImpl) then) =
      __$$PostMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int views, int likes, int commentsCount});
}

/// @nodoc
class __$$PostMetaImplCopyWithImpl<$Res>
    extends _$PostMetaCopyWithImpl<$Res, _$PostMetaImpl>
    implements _$$PostMetaImplCopyWith<$Res> {
  __$$PostMetaImplCopyWithImpl(
      _$PostMetaImpl _value, $Res Function(_$PostMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? views = null,
    Object? likes = null,
    Object? commentsCount = null,
  }) {
    return _then(_$PostMetaImpl(
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostMetaImpl implements _PostMeta {
  _$PostMetaImpl(
      {required this.views, required this.likes, required this.commentsCount});

  factory _$PostMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostMetaImplFromJson(json);

  @override
  final int views;
  @override
  final int likes;
  @override
  final int commentsCount;

  @override
  String toString() {
    return 'PostMeta(views: $views, likes: $likes, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostMetaImpl &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, views, likes, commentsCount);

  /// Create a copy of PostMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostMetaImplCopyWith<_$PostMetaImpl> get copyWith =>
      __$$PostMetaImplCopyWithImpl<_$PostMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostMetaImplToJson(
      this,
    );
  }
}

abstract class _PostMeta implements PostMeta {
  factory _PostMeta(
      {required final int views,
      required final int likes,
      required final int commentsCount}) = _$PostMetaImpl;

  factory _PostMeta.fromJson(Map<String, dynamic> json) =
      _$PostMetaImpl.fromJson;

  @override
  int get views;
  @override
  int get likes;
  @override
  int get commentsCount;

  /// Create a copy of PostMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostMetaImplCopyWith<_$PostMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
