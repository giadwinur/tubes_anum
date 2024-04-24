import 'package:flutter/widgets.dart';

class JudulKalkulator extends StatelessWidget {
  const JudulKalkulator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hitung persamaan non-linier bisection Method',
      style: TextStyle(fontSize: 50),
    );
  }
}
