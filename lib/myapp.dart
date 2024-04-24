import 'package:flutter/material.dart';
import 'package:tubes_anum/login/_index.dart';
// import 'package:tubes_anum/ui-screen/homescreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // theme: ThemeData.dark(),
        home: LoginDesk());
  }
}
