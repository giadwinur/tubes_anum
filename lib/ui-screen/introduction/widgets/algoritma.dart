part of '../_index.dart';

class Algorithm extends StatelessWidget {
  const Algorithm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Algoritma'),
        Container(
          height: 80,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/tubesanum.appspot.com/o/decoration%2Fimage%203.png?alt=media&token=6333b50d-6530-4453-8d7b-7a54b598ac73'))),
        ),
        const Text(
          'interval [x_{n-1},x_n] diganti dengan [x_{n-1},x_{n+1}] atau dengan [x_{n+1},x_n] bergantung pada tanda\nf( x_{n-1}) * f (x_{n+1}). Proses ini dilanjutkan hingga diperoleh angka nol. Karena nol diperoleh secara numerik, \nnilai c mungkin tidak sama persis dengan semua tempat desimal dari solusi analitik f(x) = 0 pada interval tertentu. \nOleh karena itu mekanisme berikut dapat digunakan untuk menghentikan iterasi bagi dua:\nf(x_k)< ε. — nilai fungsi kurang dari ε.',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          height: 80,
          width: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/tubesanum.appspot.com/o/decoration%2Fimage%204.png?alt=media&token=86a2c332-7a60-4e0c-b5da-de48a762b63e'))),
        ),
        const Text(
          'selisih antara dua хk berikutnya kurang dari ε. \nPerhatikan bahwa karena intervalnya dibelah dua pada setiap langkah, Anda dapat menghitung jumlah iterasi yang diperlukan. \nKesalahan absolut berkurang setengahnya pada setiap langkah sehingga metode ini menyatu secara linier, \nyang mana hal ini relatif lambat.\nKesalahan absolut berkurang setengahnya pada setiap langkah sehingga metode ini menyatu secara linier, \nyang mana hal ini relatif lambat.',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
