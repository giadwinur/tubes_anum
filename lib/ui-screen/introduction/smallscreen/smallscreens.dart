import 'package:flutter/material.dart';
import 'package:tubes_anum/ui-screen/introduction/smallscreen/calculate..dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 1000,
            height: null,
            color: const Color.fromARGB(255, 223, 220, 188),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  color: const Color.fromARGB(255, 223, 220, 188),
                  child: Center(
                      child: Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      './assets/images/latar.png',
                      color: const Color.fromARGB(255, 88, 74, 53).withOpacity(0.5),
                      colorBlendMode: BlendMode.darken,
                    ),
                  )),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 500,
                      color: Colors.transparent,
                      child: const Column(
                        children: [
                          Text(
                            'METODE BISEKSI / BISECTION METHOD',
                          ),
                          Text(''),
                          Text(
                            "Ide awal metode ini adalah metode table, dimana area  dibagi menjadi N bagian.metode biseksi ini membagi range  menjadi 2 bagian, dari dua bagian ini dipilih bagian mana yang mengandung dan bagian yang tidak mengandung akar dibuang.Hal ini dilakukan  berulang-ulang hingga diperoleh akar persamaan metode ini didasarkan pada teorema nilai antara untuk fungsi kontinu, yang mengatakan bahwa setiap fungsi kontinu f (x) dalam interval [a,b] yang memenuhi f (a) * f (b) < 0 harus mempunyai nol di dalam selang waktu [a,b]. Metode yang menggunakan teorema ini disebut metode dikotomi, karena membagi interval menjadi dua bagian (yang belum tentu sama). ",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: width > 900 ? 400 : null,
            color: const Color(0xffCE9461),
            child: const Column(
              children: [
                Text('Hitung persamaan non linier bisection method'),
                SizedBox(width: 20),
                Calculate(),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Container(
            width: double.infinity,
            height: width > 900 ? 400 : null,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hasil Perhitungan'),
                const SizedBox(width: 20),
                Container(
                  width: 500,
                  height: 500,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 500,
                      color: Colors.transparent,
                      child: const Column(
                        children: [
                          Text(
                            'Algoritma:',
                          ),
                          Text(''),
                          Text(
                              "interval [x_{n-1},x_n] diganti dengan [x_{n-1},x_{n+1}] atau dengan [x_{n+1},x_n] bergantung pada tanda f( x_{n-1}) * f (x_{n+1}). Proses ini dilanjutkan hingga diperoleh angka nol. Karena nol diperoleh secara numerik, nilai c mungkin tidak sama persis dengan semua tempat desimal dari solusi analitik f(x) = 0 pada interval tertentu. Oleh karena itu mekanisme berikut dapat digunakan untuk menghentikan iterasi bagi dua: f(x_k)< ε. — nilai fungsi kurang dari ε."),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: width > 100 ? 100 : null,
            color: Colors.black,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Give Me Back'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
