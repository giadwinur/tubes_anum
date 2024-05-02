import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:tubes_anum/kalkulator/data.dart';
import 'package:tubes_anum/kalkulator/widget/buttonhitung.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  bool isShowClearA = false;
  bool isShowClearB = false;
  bool isShowClearC = false;
  bool isShowClearD = false;

  String resultMessage = '';
  List<Iteration> iterations = [];

  double calculateBisection(String expression, double x0, double x1, double error) {
    Parser p = Parser();
    Expression exp = p.parse(expression);

    double f0, f1, x2, f2;

    // Evaluasi fungsi pada titik x0 dan x1
    ContextModel cm = ContextModel();
    cm.bindVariable(Variable('x'), Number(x0));
    f0 = exp.evaluate(EvaluationType.REAL, cm);

    cm.bindVariable(Variable('x'), Number(x1));
    f1 = exp.evaluate(EvaluationType.REAL, cm);

    // Periksa apakah fungsi memiliki akar pada rentang yang diberikan
    if (f0 * f1 >= 0) {
      // Tidak ada akar pada rentang yang diberikan, kembalikan nilai yang menandakan hal ini
      return -1;
    }

    // Metode bisection
    int step = 0;
    do {
      x2 = (x0 + x1) / 2;
      cm.bindVariable(Variable('x'), Number(x2));
      f2 = exp.evaluate(EvaluationType.REAL, cm);

      if (f0 * f2 < 0) {
        x1 = x2;
      } else {
        x0 = x2;
      }

      step++;
      iterations.add(Iteration(step: step, x: x2, f: f2, difference: (x1 - x0).abs()));
    } while ((x1 - x0).abs() >= error);

    // Kembalikan nilai akar yang ditemukan
    return x2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFAD7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: dc.ctrlFungsi,
            onChanged: (value) {
              setState(() {
                isShowClearA = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Fungsi',
              suffixIcon: isShowClearA
                  ? IconButton(
                      onPressed: () {
                        dc.ctrlFungsi.clear();
                        setState(() {
                          isShowClearA = false;
                        });
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: dc.ctrlX0,
            onChanged: (value) {
              setState(() {
                isShowClearB = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Nilai Awal x0',
              suffixIcon: isShowClearB
                  ? IconButton(
                      onPressed: () {
                        dc.ctrlX0.clear();
                        setState(() {
                          isShowClearB = false;
                        });
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: dc.ctrlX1,
            onChanged: (value) {
              setState(() {
                isShowClearC = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Nilai Awal x1',
              suffixIcon: isShowClearC
                  ? IconButton(
                      onPressed: () {
                        dc.ctrlX1.clear();
                        setState(() {
                          isShowClearC = false;
                        });
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: dc.ctrlError,
            onChanged: (value) {
              setState(() {
                isShowClearD = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Tolerasi Error',
              suffixIcon: isShowClearD
                  ? IconButton(
                      onPressed: () {
                        dc.ctrlError.clear();
                        setState(() {
                          isShowClearD = false;
                        });
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 10),
          ButtonHitung(
            onPressed: () {
              String expression = dc.ctrlFungsi.text;
              double x0 = double.tryParse(dc.ctrlX0.text) ?? 0;
              double x1 = double.tryParse(dc.ctrlX1.text) ?? 0;
              double error = double.tryParse(dc.ctrlError.text) ?? 0;

              iterations.clear();
              double result = calculateBisection(expression, x0, x1, error);

              if (result != -1) {
                setState(() {
                  resultMessage = 'Akar dari fungsi adalah: $result';
                });
              } else {
                setState(() {
                  resultMessage = 'Tidak ditemukan akar pada rentang yang diberikan.';
                });
              }
            },
          ),
          const SizedBox(height: 10),
          Text(
            resultMessage,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (iterations.isNotEmpty)
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Step',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'x',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'F(x)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    '|x(i) - x(i-1)|',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: iterations
                  .map(
                    (iteration) => DataRow(
                      cells: [
                        DataCell(Text('x${iteration.step}')),
                        DataCell(Text(iteration.x.toStringAsFixed(4))),
                        DataCell(Text(iteration.f.toStringAsFixed(4))),
                        DataCell(Text(iteration.difference.toStringAsFixed(4))),
                      ],
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}

class Iteration {
  final int step;
  final double x;
  final double f;
  final double difference;

  Iteration({
    required this.step,
    required this.x,
    required this.f,
    required this.difference,
  });
}
