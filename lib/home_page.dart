import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    const List<Color> clrs = [
      Color(0xFFF3A1C71),
      Color(0xFFFD76D77),
      Color(0xFFFFFAF7B)
    ];
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: clrs)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Signed in as " + user.email!),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: clrs[0],
                  child: Text('Sign the fuck out'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
