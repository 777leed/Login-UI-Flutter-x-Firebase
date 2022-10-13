import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_tsdrt/main_page.dart';

class signupUi extends StatefulWidget {
  final VoidCallback showloginPage;
  const signupUi({super.key, required this.showloginPage});

  @override
  State<signupUi> createState() => _signupUiState();
}

class _signupUiState extends State<signupUi> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    const List<Color> clrs = [
      Color(0xFFF3A1C71),
      Color(0xFFFD76D77),
      Color(0xFFFFFAF7B)
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: clrs,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  //text for signing up
                  Text(
                    "Sign Up Now!!",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Join an evergrowing community",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //textfield for username
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Username"),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //textfield for email
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Email"),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  //textfield for password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                          obscureText: true,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //textfiled for repassowrd
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirm Password"),
                          obscureText: true,
                        )),
                  ),
                  SizedBox(height: 18),
                  //button for signing up
                  GestureDetector(
                    onTap: signUp,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          decoration: BoxDecoration(
                              color: clrs[0],
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                                child: Text(
                              "Sign up",
                              style: TextStyle(color: Colors.white),
                            )),
                          )),
                    ),
                  ),

                  //text for reseting password
                  SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Already a member ?, ",
                        style: GoogleFonts.cairo(fontSize: 15)),
                    GestureDetector(
                      onTap: widget.showloginPage,
                      child: Text("Sign in now!!",
                          style:
                              GoogleFonts.cairo(fontSize: 15, color: clrs[0])),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
