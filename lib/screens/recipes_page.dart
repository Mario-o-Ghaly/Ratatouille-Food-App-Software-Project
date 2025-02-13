import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({required this.selectedIngredients});

  final List<String> selectedIngredients;

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  List<String> generatedRecipes = [];
  String recipeContent = '';

  @override
  void initState() {
    super.initState();
    generateRecipes();
  }

  Future<void> generateRecipes() async {
  // final List<String> selectedIngredients;
      // Access your API key as an environment variable (see "Set up your API key" above)
  final apiKey = "AIzaSyChdv7dILkNa4FZVHKkKLPWfzm-SaLdctE";
  if (apiKey == null) {
    print('No \$API_KEY environment variable');
    exit(1);
  }
  // For text-only input, use the gemini-pro model
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  String question = "Generate a recipe with the following ingredients: ";
  for (int i = 0; i < widget.selectedIngredients.length; i++) {
    question += (widget.selectedIngredients[i] + ", ");
    print(widget.selectedIngredients[i]);
  }
  print(question);
  final content = [Content.text(question)];
  final response = await model.generateContent(content);
  print(response.text);
  setState(() {
      recipeContent = response.text!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0D541),
      appBar: AppBar(
        title: const Text('Generated Recipes'),
        backgroundColor: const Color(0xFFF0D541),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recipe:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              recipeContent,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
  
  // Widget _buildRecipeContent() {
  //   List<String> recipeParts = recipeContent.split('\n\n');
  
  //   List<String> ingredients = [];
  //   List<String> instructions = [];
  //   for (var part in recipeParts) {
  //     if (part.startsWith('**Ingredients:**')) {
  //       ingredients = part.substring(15).split('\n*');
  //     } else if (part.startsWith('**Instructions:**')) {
  //       instructions = part.substring(16).split('\n*');
  //     }
  //   }
    
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildSectionTitle('Ingredients:'),
  //       _buildIngredientList(ingredients),
  //       SizedBox(height: 20),
  //       _buildSectionTitle('Instructions:'),
  //       _buildInstructionList(instructions),
  //     ],
  //   );
  // }

  // Widget _buildSectionTitle(String title) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Text(
  //       title,
  //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }

  // Widget _buildIngredientList(List<String> ingredients) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: ingredients
  //         .map((ingredient) => ListTile(
  //               leading: Icon(Icons.check_circle),
  //               title: Text(ingredient.trimLeft()),
  //             ))
  //         .toList(),
  //   );
  // }

  // Widget _buildInstructionList(List<String> instructions) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: instructions
  //         .map((instruction) => ListTile(
  //               leading: CircleAvatar(
  //                 backgroundColor: Colors.grey,
  //                 child: Text(
  //                   '${instructions.indexOf(instruction) + 1}',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //               title: Text(instruction.trimLeft()),
  //             ))
  //         .toList(),
  //   );
  // }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xFFF0D541),
  //     appBar: AppBar(
  //       title: const Text('Generated Recipes'),
  //       backgroundColor: const Color(0xFFF0D541),
  //     ),
  //     body: SingleChildScrollView(
  //       padding: const EdgeInsets.all(16.0),
  //       child: _buildRecipeContent(),
  //     ),
  //   );
  // }

}
