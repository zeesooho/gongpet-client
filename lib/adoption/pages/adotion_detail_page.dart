import 'package:flutter/material.dart';
import 'package:gongpet/adoption/models/stray_dog.dart';

class AdoptionDetailPage extends StatelessWidget {
  final StrayDog dog;

  const AdoptionDetailPage({Key? key, required this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('유기견 상세 정보'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(dog.popfile, height: 200, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text('종류: ${dog.kindCd}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('발견 장소: ${dog.happenPlace}'),
            Text('발견 일자: ${dog.happenDt}'),
            Text('나이: ${dog.age}'),
            Text('체중: ${dog.weight}'),
            Text('성별: ${dog.sexCd}'),
            Text('중성화 여부: ${dog.neuterYn}'),
            Text('특징: ${dog.specialMark}'),
            SizedBox(height: 16),
            Text('보호소 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('보호소 이름: ${dog.careNm}'),
            Text('보호소 전화번호: ${dog.careTel}'),
            Text('보호소 주소: ${dog.careAddr}'),
          ],
        ),
      ),
    );
  }
}
