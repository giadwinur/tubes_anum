import 'package:flutter/material.dart';
import 'package:tubes_anum/kalkulator/data.dart';
import 'package:tubes_anum/kalkulator/grafik.dart';
import 'package:tubes_anum/kalkulator/widget/buttonhitung.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController equationController = TextEditingController();
  TextEditingController errorController = TextEditingController(text: '0.0001');
  TextEditingController guess1Controller = TextEditingController();
  TextEditingController guess2Controller = TextEditingController();

  List<Map<String, dynamic>> iterations = [];
  double error = 0.001; // atau nilai yang sesuai

  void calculate() {
    String equation = equationController.text;
    double errorValue = double.tryParse(errorController.text) ?? 0;
    double guess1 = double.tryParse(guess1Controller.text) ?? 0;
    double guess2 = double.tryParse(guess2Controller.text) ?? 0;

    if (equation.isEmpty || errorValue.isNaN || guess1.isNaN || guess2.isNaN) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter valid inputs for all fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Call the bisectionMethod function with user input values
    setState(() {
      BisectionResult result = bisectionMethod(equation, guess1, guess2, errorValue);
      iterations = result.iterations;
    });
  }

  void clearInputs() {
    equationController.clear();
    errorController.clear();
    guess1Controller.clear();
    guess2Controller.clear();
    setState(() {
      iterations.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: equationController,
            decoration: const InputDecoration(
              labelText: 'Enter Function ( f(x) )',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: errorController,
            decoration: const InputDecoration(
              labelText: 'Error (e)',
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: guess1Controller,
            decoration: const InputDecoration(
              labelText: 'Guess 1 (x0)',
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: guess2Controller,
            decoration: const InputDecoration(
              labelText: 'Guess 2 (x1)',
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ButtonHitung(onCalculate: calculate, onClear: clearInputs),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Hasil Perhitungan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          iterations.isEmpty
              ? const SizedBox.shrink()
              : DataTable(
                  columns: const [
                    DataColumn(label: Text('Iteration', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('a', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('b', style: TextStyle(color: Colors.white))),
                    // DataColumn(label: Text('f(a)', style: TextStyle(color: Colors.white))),
                    // DataColumn(label: Text('f(b)', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('x', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('f(x)', style: TextStyle(color: Colors.white))),
                    DataColumn(label: Text('Error', style: TextStyle(color: Colors.white))),
                  ],
                  rows: iterations.map((iteration) {
                    return DataRow(
                      cells: [
                        DataCell(Text(iteration['Iteration'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(iteration['a'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(iteration['b'].toString(), style: const TextStyle(color: Colors.white))),
                        // DataCell(Text(iteration['f(a)'].toString(), style: const TextStyle(color: Colors.white))),
                        // DataCell(Text(iteration['f(b)'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(iteration['x'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(iteration['f(x)'].toString(), style: const TextStyle(color: Colors.white))),
                        DataCell(Text(iteration['Error'].toString(), style: const TextStyle(color: Colors.white))),
                      ],
                    );
                  }).toList(),
                ),
          const SizedBox(height: 20),
          // const Text(
          //   'Hasil Grafiknya:',
          //   style: TextStyle(color: Colors.white, fontSize: 10),
          // ),
          iterations.isEmpty ? const SizedBox.shrink() : GraphWidget(iterations: iterations, error: error),
        ],
      ),
    );
  }
}
