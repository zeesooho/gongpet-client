import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  factory Pet({
    required int id,
    required int userId,
    required String name,
    required int age,
    DateTime? birth,
    String? breed,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
