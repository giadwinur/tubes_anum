part of '../_index.dart';

class PhotoKanan extends StatelessWidget {
  const PhotoKanan({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: 700,
      decoration: const BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/tubesanum.appspot.com/o/decoration%2FRectangle%2016.png?alt=media&token=94987c13-d6d3-4861-887f-13a6b7c104e5'))),
    );
  }
}
