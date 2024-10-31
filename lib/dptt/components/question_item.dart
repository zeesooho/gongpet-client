import 'package:flutter/material.dart';
import 'package:gongpet/dptt/components/custom_radio_buttons.dart';
import 'package:gongpet/dptt/models/dptt_question.dart';

class QuestionItem extends StatelessWidget {
  final DpttQuestion question;
  final int questionNumber;
  final double? value;
  final ValueChanged<double> onChanged;
  final List<double> scores;

  const QuestionItem({
    Key? key,
    required this.question,
    required this.questionNumber,
    required this.value,
    required this.onChanged,
    required this.scores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '질문 $questionNumber: ${question.question}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomRadioButtons(
              value: value,
              onChanged: onChanged,
              scores: scores,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('아니다'),
                Text('그렇다'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
