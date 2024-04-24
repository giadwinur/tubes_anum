part of '_index.dart';

final cl = CtrlLogin();

class CtrlLogin {
  final emailctrl = TextEditingController();
  final passwordctrl = TextEditingController();

  Future<User?> signin(context) async {
    String emailAdmin = emailctrl.text;
    String passwordAdmin = passwordctrl.text;
    // try {
    //   UserCredential credential =
    //       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAdmin, password: passwordAdmin);
    //   return credential.user;
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user not found') {
    //     debugPrint('admin Tidak ditemukan');
    //   } else if (e.code == 'wrong password') {
    //     debugPrint('wrong password');
    //   }
    // }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAdmin,
        password: passwordAdmin,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
