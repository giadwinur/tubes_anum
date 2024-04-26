part of '_index.dart';

class IntroMobile extends StatelessWidget {
  const IntroMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          // const Background(),
          Container(
            width: 1000,
            height: null,
            color: const Color.fromARGB(255, 223, 220, 188),
            child: const Column(
              children: [
                Background(),
              ],
            ),
          ),
          Container(
            width: 1000,
            height: 700,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Algorithm(),
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
                Judul(),
                SizedBox(width: 20),
                KalkulatorMobile(),
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
