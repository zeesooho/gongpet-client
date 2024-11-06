import 'package:flutter/material.dart';
import 'package:gongpet/pet/models/pet.dart';
import 'package:gongpet/pet/models/pet_dto.dart';

class PetForm extends StatefulWidget {
  final Pet? initialData;
  final Function(CreatePetDto) onSubmit;

  const PetForm({
    Key? key,
    this.initialData,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _breedController;
  DateTime? _selectedBirthDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialData?.name);
    _ageController = TextEditingController(text: widget.initialData?.age.toString());
    _breedController = TextEditingController(text: widget.initialData?.breed);
    _selectedBirthDate = widget.initialData?.birth;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _breedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: '이름',
              hintText: '반려견의 이름을 입력하세요',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이름을 입력해주세요';
              }
              if (value.length > 12) {
                return '이름은 12자를 초과할 수 없습니다';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              labelText: '나이',
              hintText: '반려견의 나이를 입력하세요',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '나이를 입력해주세요';
              }
              final age = int.tryParse(value);
              if (age == null || age < 0) {
                return '올바른 나이를 입력해주세요';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _breedController,
            decoration: const InputDecoration(
              labelText: '품종',
              hintText: '반려견의 품종을 입력하세요',
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('생일'),
            subtitle: Text(_selectedBirthDate?.toString() ?? '생일을 선택하세요'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _selectedBirthDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                setState(() {
                  _selectedBirthDate = date;
                });
              }
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final dto = CreatePetDto(
                  name: _nameController.text,
                  age: int.parse(_ageController.text),
                  birth: _selectedBirthDate,
                  breed: _breedController.text.isEmpty ? null : _breedController.text,
                );
                widget.onSubmit(dto);
              }
            },
            child: Text(widget.initialData == null ? '등록하기' : '수정하기'),
          ),
        ],
      ),
    );
  }
}
