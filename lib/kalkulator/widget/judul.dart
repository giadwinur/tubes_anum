import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JudulKalkulator extends StatelessWidget {
  const JudulKalkulator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hitung persamaan non-linier bisection Method',
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
    );
  }
}
