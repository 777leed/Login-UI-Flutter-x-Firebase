import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class loginUi extends StatefulWidget {
  @override
  State<loginUi> createState() => _loginUiState();
}

class _loginUiState extends State<loginUi> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SystemUiOverlay> suo = [
      SystemUiOverlay.top,
    ];
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    SystemChrome.setEnabledSystemUIOverlays(suo);
    const List<Color> clrs = [
      Color(0xFFF3A1C71),
      Color(0xFFFD76D77),
      Color(0xFFFFFAF7B)
    ];

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: clrs)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcoming text
                Text(
                  "Hello Dear User !",
                  style: GoogleFonts.cairo(fontSize: 36),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Welcome Abroad", style: GoogleFonts.cairo(fontSize: 20)),
                SizedBox(
                  height: 30,
                ),
                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // pass textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Password"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: SignIn,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: clrs[0],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                )
                // register text
                ,
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Still not a member ?, ",
                        style: GoogleFonts.cairo(fontSize: 15)),
                    Text("Be one now!!",
                        style: GoogleFonts.cairo(fontSize: 15, color: clrs[0]))
                  ],
                )
              ],
            ),
          )))),
    );
  }

  // int _getThemColors(String hexcode) {
  //   String result = hexcode.replaceAll(('#'), '');
  //   return int.parse("0xFF" + result);
  // }
}
