import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:excel/excel.dart';
import 'dart:io';

class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color(0xFFF0D541),
      ),
      backgroundColor: const Color(0xFFF0D541),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 250,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _saveToExcel(
                    usernameController.text, passwordController.text);
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setString('username', usernameController.text);
                prefs.setString('password', passwordController.text);
                usernameController.clear();
                passwordController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sign up successful!'),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _saveToExcel(String username, String password) async {
  final excel = Excel.createExcel();
  final sheet = excel['Sheet1'];
  int row = 1;
  while (sheet.cell(CellIndex.indexByString('A$row')).value != null) {
    row++;
  }
  sheet.cell(CellIndex.indexByString('A$row')).value = username as CellValue?;
  sheet.cell(CellIndex.indexByString('B$row')).value = password as CellValue?;
  final filePath = 'documents\\usernames.xlsx';
  final file = File(filePath);
  if (!await file.exists()) {
    await file.create(recursive: true);
  }
  final bytes = await excel.encode();
  if (bytes != null) {
    await file.writeAsBytes(bytes);
  }
}
