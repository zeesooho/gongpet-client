import 'package:freezed_annotation/freezed_annotation.dart';

part 'stray_dog.g.dart';
part 'stray_dog.freezed.dart';

@freezed
class StrayDog with _$StrayDog {
  factory StrayDog({
    required String desertionNo,
    required String filename,
    required String happenDt,
    required String happenPlace,
    required String kindCd,
    required String colorCd,
    required String age,
    required String weight,
    required String noticeNo,
    required String noticeSdt,
    required String noticeEdt,
    required String popfile,
    required String processState,
    required String sexCd,
    required String neuterYn,
    required String specialMark,
    required String careNm,
    required String careTel,
    required String careAddr,
    required String orgNm,
    required String chargeNm,
    required String officetel,
  }) = _StrayDog;

  factory StrayDog.fromJson(Map<String, dynamic> json) => _$StrayDogFromJson(json);
}
