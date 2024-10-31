import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/adoption/adoption_provider.dart';
import 'package:gongpet/adoption/models/search_filter.dart';
import 'package:gongpet/adoption/models/stray_dog.dart';
import 'package:gongpet/adoption/pages/adotion_detail_page.dart';
import 'package:gongpet/adoption/pages/search_filter_page.dart';

class AdoptionPage extends ConsumerWidget {
  const AdoptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adoptionState = ref.watch(adoptionStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('유기견 입양'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchFilterPage()),
              );
              if (result != null && result is SearchFilter) {
                ref.read(adoptionStateProvider.notifier).updateFilter(result);
              }
            },
          ),
        ],
      ),
      body: adoptionState.isLoading && adoptionState.strayDogs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: adoptionState.strayDogs.length + 1,
              itemBuilder: (context, index) {
                if (index < adoptionState.strayDogs.length) {
                  final dog = adoptionState.strayDogs[index];
                  return StrayDogListItem(dog: dog);
                } else {
                  return _buildLoadMoreButton(ref);
                }
              },
            ),
    );
  }

  Widget _buildLoadMoreButton(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text('더 보기'),
        onPressed: () {
          ref.read(adoptionStateProvider.notifier).loadStrayDogs();
        },
      ),
    );
  }
}

class StrayDogListItem extends StatelessWidget {
  final StrayDog dog;

  const StrayDogListItem({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(dog.filename, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(dog.kindCd.replaceAll('[개] ', '')),
      subtitle: Text('발견 장소: ${dog.happenPlace}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdoptionDetailPage(dog: dog),
          ),
        );
      },
    );
  }
}
