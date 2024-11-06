import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_dto.freezed.dart';
part 'pet_dto.g.dart';

@freezed
class CreatePetDto with _$CreatePetDto {
  factory CreatePetDto({
    required String name,
    required int age,
    DateTime? birth,
    String? breed,
  }) = _CreatePetDto;

  factory CreatePetDto.fromJson(Map<String, dynamic> json) => _$CreatePetDtoFromJson(json);
}

@freezed
class UpdatePetDto with _$UpdatePetDto {
  factory UpdatePetDto({
    String? name,
    int? age,
    DateTime? birth,
    String? breed,
  }) = _UpdatePetDto;

  factory UpdatePetDto.fromJson(Map<String, dynamic> json) => _$UpdatePetDtoFromJson(json);
}
