import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes_anum/login/_index.dart';
import 'package:tubes_anum/ui-screen/homescreen.dart';

class FieldLogin extends StatefulWidget {
  const FieldLogin({super.key});

  @override
  State<FieldLogin> createState() => _FieldLoginState();
}

class _FieldLoginState extends State<FieldLogin> {
  bool _passVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          child: TextFormField(
            autofocus: false,
            controller: cl.emailctrl,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Masukan email',
              border: OutlineInputBorder(),
              labelText: 'Masukan email',
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 350,
          child: TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "password required";
              }
              return null;
            },
            controller: cl.passwordctrl,
            obscureText: _passVisibility,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Masukan Password',
              border: const OutlineInputBorder(),
              labelText: 'masukan password',
              suffixIcon: IconButton(
                onPressed: () {
                  _passVisibility = !_passVisibility;

                  setState(() {});
                },
                icon: _passVisibility ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () async {
            User? user = await cl.signin(context);
            if (user != null) {
              debugPrint('password lemah');

              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            } else {
              final snackbar = SnackBar(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                behavior: SnackBarBehavior.floating,
                content: const Text(
                  'Account tidak ditemukan',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: (Colors.white),
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: Colors.black,
                  onPressed: () {},
                ),
              );

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: const Text(
            "LogIn",
          ),
        ),
      ],
    );
  }
}
