import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.mealTitle,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? mealTitle;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void _selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meal: meal,
          onToggleFavoriteMeal: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: meals[index],
          onSelectMeal: () {
            _selectedMeal(context, meals[index]);
          },
        );
      },
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset('images/Oops.png'),
            Text(
              'Oops! No meal found',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Please select a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    return mealTitle == null
        ? content
        : Scaffold(
            appBar: AppBar(
              title: Text(mealTitle!),
            ),
            body: content,
          );
  }
}
