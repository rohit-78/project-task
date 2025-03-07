import 'package:flutter/material.dart';
import 'package:project_task/view/login_screen/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
