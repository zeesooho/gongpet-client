import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/dptt/models/dptt_result.dart';

class ResultPage extends ConsumerWidget {
  final Map<String, double> testResults;
  final List<DpttResult> possibleResults;

  ResultPage({required this.testResults, required this.possibleResults});

  DpttResult _determineResult() {
    String resultType = '';

    // introversion_extroversion
    if (testResults['introversion_extroversion']! < 51) {
      resultType += 'I';
    } else {
      resultType += 'E';
    }

    // dependency_leadership
    if (testResults['dependence_leadership']! < 51) {
      resultType += 'D';
    } else {
      resultType += 'L';
    }

    // rationality_emotionality
    if (testResults['rationality_emotionality']! < 51) {
      resultType += 'R';
    } else {
      resultType += 'E';
    }

    // 결정된 타입에 해당하는 TestResult 객체 찾기
    return possibleResults.firstWhere(
      (result) => result.type == resultType,
      orElse: () => DpttResult(
        type: 'Unknown',
        name: '알 수 없는 유형',
        best: 'N/A',
        worst: 'N/A',
        comments: ['해당하는 유형을 찾을 수 없습니다.'],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = _determineResult();

    return Scaffold(
      appBar: AppBar(
        title: Text('테스트 결과'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('당신의 반려견 성격 유형은:', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 8),
              Text(
                result.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 16),
              Text(
                '유형 코드: ${result.type}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 24),
              Text(
                '상세 설명:',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              ...result.comments.map((comment) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(comment),
                  )),
              SizedBox(height: 24),
              Text(
                '궁합:',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text('가장 잘 맞는 유형: ${result.best}'),
              Text('가장 안 맞는 유형: ${result.worst}'),
              SizedBox(height: 24),
              Text(
                '점수 분포:',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              ...testResults.entries.map((entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text('${entry.key}: ${entry.value.toStringAsFixed(2)}'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
