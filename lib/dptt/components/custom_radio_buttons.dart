import 'package:flutter/material.dart';

class CustomRadioButtons extends StatelessWidget {
  final double? value;
  final ValueChanged<double> onChanged;
  final List<double> scores;

  const CustomRadioButtons({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.scores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: scores.map((score) {
        final index = scores.indexOf(score);
        final size = 20.0 + (index - 3).abs() * 2.0;
        return GestureDetector(
          onTap: () => onChanged(score),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value == score ? Colors.blue : Colors.grey[300],
              border: Border.all(color: Colors.blue, width: 2),
            ),
          ),
        );
      }).toList(),
    );
  }
}
