import 'package:flutter/material.dart';
import 'package:tubes_anum/kalkulator/calculator.coba.dart';
import 'package:tubes_anum/kalkulator/widget/buttonhistory.dart';
import 'package:tubes_anum/kalkulator/widget/buttonhitung.dart';
import 'package:tubes_anum/kalkulator/widget/judul.dart';
import 'package:tubes_anum/kalkulator/widget/textfield.dart';

class KalkulatorMobile extends StatelessWidget {
  const KalkulatorMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      // height: ,
      color: const Color.fromARGB(255, 46, 46, 44),
      child: const Column(
        children: [
          JudulKalkulator(),
          Calculate(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ButtonHitung(
              //   onPressed:,
              // ),
              // SizedBox(width: 10),
              // ButtonHistory(),
            ],
          )
        ],
      ),
    );
  }
}
