import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/global/custom_dio.dart';
import 'package:gongpet/pet/pet_api_client.dart';

final petApiClientProvider = Provider((ref) {
  final dio = ref.watch(authDioProvider);
  return PetApiClient(dio);
});

final petsProvider = FutureProvider.autoDispose((ref) async {
  final client = ref.watch(petApiClientProvider);
  return client.getMyPets();
});

final petDetailProvider = FutureProvider.family.autoDispose((ref, int id) async {
  final client = ref.watch(petApiClientProvider);
  return client.getPetById(id);
});
