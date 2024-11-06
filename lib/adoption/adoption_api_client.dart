import 'package:dio/dio.dart';
import 'package:gongpet/adoption/models/kind_item.dart';
import 'package:gongpet/adoption/models/sido_item.dart';
import 'package:gongpet/adoption/models/sigungu_item.dart';
import 'package:gongpet/adoption/models/stray_dog.dart';
import 'package:gongpet/global/custom_dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'adoption_api_client.g.dart';

@RestApi()
abstract class AdoptionApiClient {
  factory AdoptionApiClient(Dio dio, {String baseUrl}) = _AdoptionApiClient;

  @GET('/stray-dog')
  Future<List<StrayDog>> getStrayDogs(
    Map<String, String?> map, {
    @Query('pageNo') String? pageNo,
    @Query('numOfRows') String? numOfRows,
    @Query('upkind') String? upkind,
    @Query('state') String? state,
    @Query('bgnde') String? bgnde,
    @Query('endde') String? endde,
    @Query('upr_cd') String? uprCd,
    @Query('org_cd') String? orgCd,
    @Query('care_reg_no') String? careRegNo,
    @Query('kind') String? kind,
    @Query('neuter_yn') String? neuterYn,
  });

  @GET("/stray-dog/sido")
  Future<List<SidoItem>> getSido();

  @GET("/stray-dog/sigungu")
  Future<List<SigunguItem>> getSigungu(
    @Query("upr_cd") String uprCd,
  );

  @GET("/stray-dog/kind")
  Future<List<KindItem>> getKind(
    @Query("up_kind_cd") String upKindCd,
  );
}

final adoptionApiClientProvider = Provider<AdoptionApiClient>((ref) {
  final dio = ref.watch(baseDioProvider);
  return AdoptionApiClient(dio);
});
