import 'package:flutter/material.dart';
import 'package:ratatouille/screens/login_page.dart';

void main() {
  runApp(const RatatouilleApp());
}

class RatatouilleApp extends StatelessWidget {
  const RatatouilleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ratatouille',
      theme: ThemeData(
        primaryColor: const Color(0xFF186996),
        fontFamily: 'RatatouilleFont',
      ),
      home: LoginPage(),
    );
  }
}
