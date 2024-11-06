import 'package:dio/dio.dart' hide Headers;
import 'package:gongpet/pet/models/pet.dart';
import 'package:gongpet/pet/models/pet_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'pet_api_client.g.dart';

@RestApi()
abstract class PetApiClient {
  factory PetApiClient(Dio dio) = _PetApiClient;

  @GET('/pets')
  @Headers({'protected': 'true'})
  Future<List<Pet>> getMyPets();

  @GET('/pets/{id}')
  @Headers({'protected': 'true'})
  Future<Pet> getPetById(@Path('id') int id);

  @POST('/pets')
  @Headers({'protected': 'true'})
  Future<Pet> createPet(@Body() CreatePetDto dto);

  @PUT('/pets/{id}')
  @Headers({'protected': 'true'})
  Future<Pet> updatePet(
    @Path('id') int id,
    @Body() UpdatePetDto dto,
  );

  @DELETE('/pets/{id}')
  @Headers({'protected': 'true'})
  Future<void> deletePet(@Path('id') int id);
}
