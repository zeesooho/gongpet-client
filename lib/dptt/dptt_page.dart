import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/dptt/components/question_item.dart';
import 'package:gongpet/dptt/dptt_result_page.dart';
import 'package:gongpet/dptt/models/dptt_question.dart';
import 'package:gongpet/dptt/models/dptt_result.dart';
import 'package:gongpet/global/custom_dio.dart';

class DpttTestSheet {
  List<DpttQuestion> questions;
  List<DpttResult> results;

  DpttTestSheet({required this.questions, required this.results});
}

final dpttTestSheetProvider = FutureProvider<DpttTestSheet>((ref) async {
  final dio = ref.read(baseDioProvider);
  try {
    final response = await dio.get('/dptt/test-sheet');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      final questions = (jsonData['questions'] as List).map((q) => DpttQuestion.fromJson(q)).toList();
      final results = (jsonData['results'] as List).map((q) => DpttResult.fromJson(q)).toList();
      return DpttTestSheet(questions: questions, results: results);
    } else {
      throw Exception('Failed to load questions: ${response.statusCode}');
    }
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw Exception('연결 시간 초과. 네트워크 상태를 확인해주세요.');
    } else if (e.type == DioExceptionType.connectionError) {
      throw Exception('서버에 연결할 수 없습니다. 서버가 실행 중인지 확인해주세요.');
    } else {
      throw Exception('네트워크 오류: ${e.message}');
    }
  }
});

class DpttPage extends ConsumerStatefulWidget {
  const DpttPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DpttPage> createState() => _DpttPageState();
}

class _DpttPageState extends ConsumerState<DpttPage> {
  final Map<int, double> answers = {};
  final List<double> scores = [-5, -3, -1.5, 0, 1.5, 3, 5];

  Map<String, double> calculateResults(List<DpttQuestion> questions) {
    Map<String, double> results = {};
    for (int i = 0; i < questions.length; i++) {
      if (answers.containsKey(i)) {
        String option = questions[i].option;
        double score = answers[i]! * questions[i].vector;
        results[option] = (results[option] ?? 50) + score;
      }
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final testSheets = ref.watch(dpttTestSheetProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('성격 유형 검사'),
      ),
      body: testSheets.when(
        data: (testSheet) => ListView.builder(
          itemCount: testSheet.questions.length,
          itemBuilder: (context, index) {
            return QuestionItem(
              question: testSheet.questions[index],
              questionNumber: index + 1,
              value: answers[index],
              onChanged: (value) {
                setState(() {
                  answers[index] = value;
                });
              },
              scores: scores,
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.refresh(dpttTestSheetProvider),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          child: Text('제출'),
          onPressed: testSheets.maybeWhen(
            data: (testSheet) => answers.length == testSheet.questions.length
                ? () {
                    Map<String, double> results = calculateResults(testSheet.questions);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultPage(
                          testResults: results,
                          possibleResults: testSheet.results,
                        ),
                      ),
                    );
                  }
                : null,
            orElse: () => null,
          ),
        ),
      ),
    );
  }
}
