import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_application/login_page.dart';

import 'homepage.dart';
import 'login_register.dart';

class AuthPage extends StatelessWidget {
  AuthPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          } else {
            return LoginRegister();
          }
        },
      ),
    );
  }
}
