// widget/buttonhitung.dart
import 'package:flutter/material.dart';

class ButtonHitung extends StatelessWidget {
  final VoidCallback? onPressed;

  const ButtonHitung({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Hitung'),
    );
  }
}
