import 'package:flutter/material.dart';
import 'package:tubes_anum/ui-screen/introduction/_index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Background(),
              Judul(),
              Algorithm(),
            ],
          ),
        ));
  }
}
