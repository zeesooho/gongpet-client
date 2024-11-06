import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/global/components/generic_data_state_widget.dart';
import 'package:gongpet/pet/components/pet_form.dart';
import 'package:gongpet/pet/models/pet.dart';
import 'package:gongpet/pet/models/pet_dto.dart';
import 'package:gongpet/pet/pet_provider.dart';
import 'package:intl/intl.dart';

class MyPetsList extends ConsumerWidget {
  const MyPetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericDataStateWidget<List<Pet>>(
      fetchData: () => ref.read(petApiClientProvider).getMyPets(),
      initialWidget: () => const SizedBox(),
      loadingWidget: () => const Center(child: CircularProgressIndicator()),
      errorWidget: (error) => Center(child: Text('Error: $error')),
      successWidget: (pets) => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.pets)),
                title: Text(pet.name),
                subtitle: Text(
                  '${pet.breed ?? "믹스"} • ${pet.age}살${pet.birth != null ? ' • ${DateFormat('yyyy.MM.dd').format(pet.birth!)}' : ''}',
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('수정'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('삭제'),
                    ),
                  ],
                  onSelected: (value) async {
                    if (value == 'edit') {
                      await _showEditPetDialog(context, ref, pet);
                    } else if (value == 'delete') {
                      await _showDeleteConfirmDialog(context, ref, pet);
                    }
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showAddPetDialog(context, ref),
            child: const Text('반려견 추가'),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddPetDialog(BuildContext context, WidgetRef ref) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('반려견 추가'),
        content: SingleChildScrollView(
          child: PetForm(
            onSubmit: (dto) async {
              try {
                await ref.read(petApiClientProvider).createPet(dto);
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ref.refresh(petsProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('반려견 추가 실패: $e')),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showEditPetDialog(
    BuildContext context,
    WidgetRef ref,
    Pet pet,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('반려견 정보 수정'),
        content: SingleChildScrollView(
          child: PetForm(
            initialData: pet,
            onSubmit: (dto) async {
              try {
                await ref.read(petApiClientProvider).updatePet(
                      pet.id,
                      UpdatePetDto(
                        name: dto.name,
                        age: dto.age,
                        birth: dto.birth,
                        breed: dto.breed,
                      ),
                    );
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ref.refresh(petsProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('반려견 정보 수정 실패: $e')),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    Pet pet,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('반려견 삭제'),
        content: Text('${pet.name}을(를) 정말 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await ref.read(petApiClientProvider).deletePet(pet.id);
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ref.refresh(petsProvider);
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('반려견 삭제 실패: $e')),
                  );
                }
              }
            },
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }
}
