import 'package:flutter/material.dart';
import 'package:ratatouille/screens/ingredients_page.dart';

class CookingPage extends StatelessWidget {
  final String username;

  const CookingPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Ratatouille'),
        backgroundColor: const Color(0xFFF0D541),
      ),
      backgroundColor: const Color(0xFFF0D541),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello $username',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/rat.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IngredientsPage()),
                );
              },
              child: const Text('Let\'s Start Cooking'),
            ),
          ],
        ),
      ),
    );
  }
}
