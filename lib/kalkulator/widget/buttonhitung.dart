import 'package:flutter/material.dart';

class ButtonHitung extends StatelessWidget {
  final VoidCallback onCalculate;
  final VoidCallback onClear;

  const ButtonHitung({super.key, required this.onCalculate, required this.onClear});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: onCalculate,
          child: const Text('Calculate'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: onClear,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
