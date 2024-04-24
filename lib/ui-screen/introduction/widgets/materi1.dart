part of '../_index.dart';

class Judul extends StatelessWidget {
  const Judul({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Text(
          'METODE BISEKSI / BISECTION METHOD',
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(height: 40),
        Text(
          ' Ide awal metode ini adalah metode table, dimana area  dibagi menjadi N bagian.  \nmetode biseksi ini membagi range  menjadi 2 bagian, dari dua bagian ini dipilih bagian \nmana yang mengandung dan bagian yang tidak mengandung akar dibuang.Hal ini dilakukan  berulang-ulang hingga \ndiperoleh akar persamaan metode ini didasarkan pada teorema nilai antara untuk fungsi kontinu, yang mengatakan \nbahwa setiap fungsi kontinu f (x) dalam interval [a,b] yang memenuhi f (a) * f (b) < 0 harus mempunyai nol di dalam selang waktu [a,b].\nMetode yang menggunakan teorema ini disebut metode dikotomi, karena membagi interval menjadi dua bagian (yang belum tentu sama).',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
