part of '_index.dart';

class KalkulatorDesktop extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const KalkulatorDesktop({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Kalkulator Desktop',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              JudulKalkulator(),
              Calculate() // Memanggil kalkulator dari file kalkulator.dart
            ],
          ),
        ),
      ),
    );
  }
}
