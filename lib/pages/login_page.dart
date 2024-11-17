import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpdesk/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTapRegister;
  const LoginPage({super.key, this.onTapRegister});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;

  // HttpService httpService = HttpService();
  // Future<Login>? _futureLogin;

  // Future showLoginErrorDialog(error, stackTrace) {
  //   String? c;
  //   if (error is Login) {
  //     Map<String, dynamic>? nerror = error.errorMsg;
  //     c = '${nerror!.values.first[0]}';
  //   } else {
  //     c = error.toString();
  //   }
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return ErrorDialog(content: c!);
  //     },
  //   );
  // }

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  'Log in',
                  style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Email address textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      toolbarOptions: const ToolbarOptions(
                        copy: true,
                        cut: true,
                        paste: true,
                        selectAll: true,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Email Address',
                        contentPadding: EdgeInsets.only(left: 20.0),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            autocorrect: false,
                            enableSuggestions: false,
                            textAlignVertical: TextAlignVertical.center,
                            // ignore: deprecated_member_use
                            toolbarOptions: const ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: true,
                              selectAll: true,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Password',
                              contentPadding: const EdgeInsets.only(left: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.roboto(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.right,
                  ),
                ),

                const SizedBox(height: 25),

                // Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F6BD7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () => login(context),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.roboto(fontSize: 16, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: widget.onTapRegister,
                      child: Text(
                        ' Sign up here',
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
