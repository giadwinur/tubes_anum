part of '../_index.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: width,
      // color: Colors.amber,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/tubesanum.appspot.com/o/decoration%2F8d689ceb96b5bd2d94f94796e1472ac5%201.png?alt=media&token=e5db7edf-84da-414c-abe5-6b52f5400031'),
            fit: BoxFit.fill),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'KALKULATOR\nBISECTION METHOD',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('DEVELOPER :'),
                  FadeAnimatedText('Dhea Nurlita'),
                  FadeAnimatedText('Gia Dwi Nur Anugrah'),
                  FadeAnimatedText('Dhea Nurlita'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
