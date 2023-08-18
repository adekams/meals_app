import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(mealTitle: 'meal Title', meals: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Meal Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          /*childAspectRatio specifies each card width -can also be set to 1.5*/
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category,
                onSelectCategory: () => _selectCategory(context)),
        ],
      ),
    );
  }
}
