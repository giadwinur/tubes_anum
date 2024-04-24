part of '_index.dart';

class LoginDesk extends StatefulWidget {
  const LoginDesk({super.key});

  @override
  State<LoginDesk> createState() => _LoginDeskState();
}

class _LoginDeskState extends State<LoginDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleHello(),
                const SubtitleLogin(),
                const FieldLogin(),
                Row(
                  children: [
                    const Text("Don't Have Any Account ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistDesktop()));
                      },
                      child: const Text('Register'),
                    )
                  ],
                ),
              ],
            ),
            const PhotoKanan()
          ],
        ));
  }
}
