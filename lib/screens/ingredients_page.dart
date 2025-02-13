import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ratatouille/screens/recipes_page.dart';

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  List<String> ingredients = [
    // Herbs and Spices
    'Salt',
    'Black pepper',
    'Garlic powder',
    'Onion powder',
    'Paprika',
    'Cumin',
    'Chili powder',
    'Oregano',
    'Basil',
    'Thyme',
    'Rosemary',
    'Parsley',
    'Bay leaves',
    'Curry powder',
    'Cinnamon',
    'Nutmeg',
    'Ginger',
    'Turmeric',
    'Cayenne pepper',

    // Cooking Oils
    'Olive oil',
    'Vegetable oil',
    'Canola oil',
    'Coconut oil',
    'Sesame oil',

    // Vinegars
    'Balsamic vinegar',
    'White vinegar',
    'Red wine vinegar',
    'Apple cider vinegar',
    'Rice vinegar',

    // Condiments and Sauces
    'Ketchup',
    'Mustard',
    'Mayonnaise',
    'Soy sauce',
    'Worcestershire sauce',
    'Hot sauce',
    'Barbecue sauce',
    'Sriracha',
    'Hoisin sauce',
    'Fish sauce',
    'Tomato sauce/paste',

    // Grains and Cereals
    'Rice',
    'Pasta',
    'Quinoa',
    'Oats',
    'Flour',
    'Bread crumbs',

    // Legumes
    'Lentils',
    'Chickpeas',
    'Black beans',
    'Kidney beans',
    'Cannellini beans',

    // Canned Goods
    'Diced tomatoes',
    'Tomato sauce',
    'Tomato paste',
    'Coconut milk',
    'Broth',

    // Dairy and Non-dairy
    'Milk',
    'Butter',
    'Cheese',
    'Yogurt',
    'Cream cheese',
    'Sour cream',

    // Proteins
    'Chicken',
    'Beef',
    'Pork',
    'Fish',
    'Tofu',
    'Eggs',

    // Fresh Produce
    'Onions',
    'Garlic',
    'Potatoes',
    'Carrots',
    'Bell peppers',
    'Tomatoes',
    'Lettuce',
    'Spinach',
    'Broccoli',
    'Cauliflower',
    'Zucchini',
    'Cucumbers',
    'Avocados',
    'Lemons',
    'Limes',
    'Apples',
    'Bananas',
    'Oranges',

    // Nuts and Seeds
    'Almonds',
    'Walnuts',
    'Pecans',
    'Cashews',
    'Peanuts',
    'Sunflower seeds',
    'Chia seeds',
    'Flaxseeds',
    'Sesame seeds',

    // Sweeteners
    'Granulated sugar',
    'Brown sugar',
    'Honey',
    'Maple syrup',
    'Agave syrup',
    'Stevia',
    'Powdered sugar',

    // Baking Ingredients
    'Baking powder',
    'Baking soda',
    'Vanilla extract',
    'Cocoa powder',
    'Chocolate chips',
    'Yeast',
    'Cornstarch',
    'Molasses',

    // Miscellaneous
    'Vinegar',
    'Honey',
    'Breadcrumbs',
    'Stock cubes',
    'Bouillon',
    'Gelatin',
    'Cornmeal',
    'Pickles',
  ];

  Map<String, bool> checkedIngredients = {};

  @override
  void initState() {
    super.initState();
    // Initialize all ingredients as unchecked
    for (String ingredient in ingredients) {
      checkedIngredients[ingredient] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Kitchen Ingredients'),
        backgroundColor: const Color(0xFFF0D541),
      ),
      backgroundColor: const Color(0xFFF0D541),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Widget for each group with title
            _buildIngredientGroup(
                'Herbs and Spices', ingredients.sublist(0, 18)),
            _buildIngredientGroup('Cooking Oils', ingredients.sublist(18, 23)),
            _buildIngredientGroup('Vinegars', ingredients.sublist(23, 28)),
            _buildIngredientGroup(
                'Condiments and Sauces', ingredients.sublist(28, 38)),
            _buildIngredientGroup(
                'Grains and Cereals', ingredients.sublist(38, 44)),
            _buildIngredientGroup('Legumes', ingredients.sublist(44, 49)),
            _buildIngredientGroup('Canned Goods', ingredients.sublist(49, 54)),
            _buildIngredientGroup(
                'Dairy and Non-dairy', ingredients.sublist(54, 60)),
            _buildIngredientGroup('Proteins', ingredients.sublist(60, 66)),
            _buildIngredientGroup('Fresh Produce', ingredients.sublist(66, 87)),
            _buildIngredientGroup(
                'Nuts and Seeds', ingredients.sublist(87, 96)),
            _buildIngredientGroup('Sweeteners', ingredients.sublist(96, 103)),
            _buildIngredientGroup(
                'Baking Ingredients', ingredients.sublist(103, 111)),
            _buildIngredientGroup('Miscellaneous', ingredients.sublist(111)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                // Action to search for recipes
                List<String> selectedIngredients = [];
                for (String ingredient in checkedIngredients.keys) {
                  if (checkedIngredients[ingredient] == true) {
                    selectedIngredients.add(ingredient);
                  }
                }
                // Navigate to RecipesPage and pass selectedIngredients as arguments
                if (selectedIngredients.isNotEmpty){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipesPage(selectedIngredients: selectedIngredients),
                    ),
                  );
                }
              },
              child: const Text('Generate Recipes'),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                // Action to open camera
              },
            ),
          ],
        ),
      ),
    );
  }

// Widget for each group with title
  Widget _buildIngredientGroup(String title, List<String> ingredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        ...ingredients.map((ingredient) {
          return CheckboxListTile(
            title: Text(ingredient),
            value: checkedIngredients[ingredient],
            onChanged: (bool? value) {
              setState(() {
                checkedIngredients[ingredient] = value!;
              });
            },
          );
        }).toList(),
      ],
    );
  }
}
