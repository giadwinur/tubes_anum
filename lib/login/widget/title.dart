part of '../_index.dart';

class TitleHello extends StatelessWidget {
  const TitleHello({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30.0,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('HELLO FRIENDS'),
        ],
      ),
    );
  }
}
