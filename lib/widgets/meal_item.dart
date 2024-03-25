import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/mealDetails.dart';
import 'package:meals/widgets/meal_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => MealDetails(
                meal: meal,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        },
        child: MealImage(meal: meal),
      ),
    );
  }
}
