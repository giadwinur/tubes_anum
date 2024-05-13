import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class GraphWidget extends StatelessWidget {
  final List<Map<String, dynamic>> iterations;
  final double error;

  const GraphWidget({Key? key, required this.iterations, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IterationData> data = [];

    for (var iteration in iterations) {
      data.add(IterationData(iteration['Iteration'], iteration['x']));
    }

    var series = [
      charts.Series<IterationData, int>(
        id: 'Iterations',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (IterationData iterData, _) => iterData.iteration,
        measureFn: (IterationData iterData, _) => iterData.x,
        data: data,
      )
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hasil Grafiknya:',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Container(
          height: 300,
          decoration: BoxDecoration(
            // Mengatur kotak dengan latar belakang putih
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0), // Opsional: memberikan sudut bulat pada kotak
          ),
          child: charts.LineChart(
            series,
            animate: true,
            defaultRenderer: charts.LineRendererConfig(includePoints: true),
            domainAxis: charts.NumericAxisSpec(
              viewport: charts.NumericExtents(0, iterations.length.toDouble()),
            ),
          ),
        ),
      ],
    );
  }
}

class IterationData {
  final int iteration;
  final double x;

  IterationData(this.iteration, this.x);
}








// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class GraphWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> iterations;
//   final double error; // Tambahkan variabel error

//   const GraphWidget({Key? key, required this.iterations, required this.error}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<FlSpot> spots = _generateSpots(iterations);

//     return AspectRatio(
//       aspectRatio: 1.7,
//       child: LineChart(
//         LineChartData(
//           gridData: const FlGridData(show: true),
//           titlesData: const FlTitlesData(show: true),
//           borderData: FlBorderData(show: true),
//           lineBarsData: [
//             LineChartBarData(
//               spots: spots,
//               isCurved: true,
//               color: Colors.blue,
//               dotData: const FlDotData(show: false),
//               belowBarData: BarAreaData(show: false),
//             ),
//           ],
//           minX: _findMinX(spots),
//           maxX: _findMaxX(spots),
//         ),
//       ),
//     );
//   }

//   List<FlSpot> _generateSpots(List<Map<String, dynamic>> iterations) {
//     List<FlSpot> spots = [];
//     for (var i = 0; i < iterations.length; i++) {
//       var iteration = iterations[i];
//       double x = iteration['x'];
//       double fx = iteration['f(x)'];
//       spots.add(FlSpot(x, fx));

//       // Check if this is the last iteration and if it has reached the desired error
//       if (i == iterations.length - 1 && double.parse(iteration['Error']) <= error) {
//         break;
//       }
//     }
//     return spots;
//   }

//   double _findMinX(List<FlSpot> spots) {
//     double minX = double.infinity;
//     for (var spot in spots) {
//       if (spot.x < minX) {
//         minX = spot.x;
//       }
//     }
//     return minX;
//   }

//   double _findMaxX(List<FlSpot> spots) {
//     double maxX = double.negativeInfinity;
//     for (var spot in spots) {
//       if (spot.x > maxX) {
//         maxX = spot.x;
//       }
//     }
//     return maxX;
//   }
// }
