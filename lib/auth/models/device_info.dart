import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';
part 'device_info.g.dart';

@freezed
class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({
    required String id,
    required String deviceInfo,
    required DateTime createdAt,
    required DateTime expiresAt,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => _$DeviceInfoFromJson(json);
}
