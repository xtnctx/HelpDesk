import 'package:flutter/material.dart';
import 'package:helpdesk/pages/login_page.dart';
import 'package:helpdesk/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show login page
  bool showLoginPage = true;

  // toggle betweem login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTapRegister: togglePages);
    } else {
      return RegisterPage(onTapLogin: togglePages);
    }
  }
}
