import 'package:flutter/material.dart';
import 'package:project_tsdrt/loginUi.dart';
import 'package:project_tsdrt/signupUi.dart';

class authpage extends StatefulWidget {
  const authpage({super.key});

  @override
  State<authpage> createState() => _authpageState();
}

class _authpageState extends State<authpage> {
  bool showloginPage = true;
  void toggleScreens() {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage) {
      return loginUi(showsignupPage: toggleScreens);
    } else {
      return signupUi(showloginPage: toggleScreens);
    }
  }
}
