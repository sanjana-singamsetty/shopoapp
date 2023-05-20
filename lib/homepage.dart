import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _signUserOut(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'components/download (1).png',
              width: 150.0,
              height: 150.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Drink Coffee here\n${user?.email ?? ""}',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _signUserOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }
}
