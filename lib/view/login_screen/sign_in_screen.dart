import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_task/core/utils/color_constant.dart';
import 'package:project_task/view/home_screen/home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _emailError;
  String? _passwordError;

  void _validateEmail() {
    setState(() {
      if (!_emailController.text.contains('@')) {
        _emailError = "Incorrect Email Address";
      } else {
        _emailError = null;
      }
    });
  }
  void _validatePassword() {
    setState(() {
      if (_passwordController.text.length < 6) {
        _passwordError = "Password don't match";
      } else {
        _passwordError = null;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(toolbarHeight: 1,backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:40),
              Image.asset('assets/images/logo.png', height: 80),
              const SizedBox(height: 10), const SizedBox(height: 30),
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign In",
                  style: GoogleFonts.notoSerif(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.alternate_email, color: Colors.teal),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.normal),
                        errorText: _emailError,

                      ),
                      onChanged: (value) => _validateEmail(),

                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(Icons.lock_open_outlined, color: Colors.teal),
                  const SizedBox(width: 20),
                  Expanded(
                    child:   TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        errorText: _passwordError,
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) => _validatePassword(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child:  Text("Sign In", style: GoogleFonts.notoSerifDevanagari(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 5),
                  Text("OR"),
                  SizedBox(width: 5),
                  Expanded(child: Divider())
                ],
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/google.png', height: 24),
                label: const Text("Continue with Google", style: TextStyle(fontSize: 18,color: AppColors.black)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("New to Adhicine?", style: GoogleFonts.notoSerifDevanagari(color: AppColors.black,fontWeight: FontWeight.w500)),
                  TextButton(
                    onPressed: () {},
                    child:  Text("Sign Up", style: GoogleFonts.notoSerifDevanagari(color: AppColors.blue,fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}