// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostUser _$PostUserFromJson(Map<String, dynamic> json) {
  return _PostUser.fromJson(json);
}

/// @nodoc
mixin _$PostUser {
  UserProfile get userProfile => throw _privateConstructorUsedError;

  /// Serializes this PostUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostUserCopyWith<PostUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUserCopyWith<$Res> {
  factory $PostUserCopyWith(PostUser value, $Res Function(PostUser) then) =
      _$PostUserCopyWithImpl<$Res, PostUser>;
  @useResult
  $Res call({UserProfile userProfile});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$PostUserCopyWithImpl<$Res, $Val extends PostUser>
    implements $PostUserCopyWith<$Res> {
  _$PostUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
  }) {
    return _then(_value.copyWith(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ) as $Val);
  }

  /// Create a copy of PostUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostUserImplCopyWith<$Res>
    implements $PostUserCopyWith<$Res> {
  factory _$$PostUserImplCopyWith(
          _$PostUserImpl value, $Res Function(_$PostUserImpl) then) =
      __$$PostUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfile userProfile});

  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$$PostUserImplCopyWithImpl<$Res>
    extends _$PostUserCopyWithImpl<$Res, _$PostUserImpl>
    implements _$$PostUserImplCopyWith<$Res> {
  __$$PostUserImplCopyWithImpl(
      _$PostUserImpl _value, $Res Function(_$PostUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
  }) {
    return _then(_$PostUserImpl(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostUserImpl implements _PostUser {
  _$PostUserImpl({required this.userProfile});

  factory _$PostUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostUserImplFromJson(json);

  @override
  final UserProfile userProfile;

  @override
  String toString() {
    return 'PostUser(userProfile: $userProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUserImpl &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userProfile);

  /// Create a copy of PostUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUserImplCopyWith<_$PostUserImpl> get copyWith =>
      __$$PostUserImplCopyWithImpl<_$PostUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostUserImplToJson(
      this,
    );
  }
}

abstract class _PostUser implements PostUser {
  factory _PostUser({required final UserProfile userProfile}) = _$PostUserImpl;

  factory _PostUser.fromJson(Map<String, dynamic> json) =
      _$PostUserImpl.fromJson;

  @override
  UserProfile get userProfile;

  /// Create a copy of PostUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostUserImplCopyWith<_$PostUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
