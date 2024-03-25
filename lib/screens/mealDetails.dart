import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          MealImage(
            meal: meal,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: meal.ingredients
                .asMap()
                .entries
                .map((ingredient) => Text(
                      '${ingredient.key + 1}. ${ingredient.value}',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Steps",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: meal.steps
                .asMap()
                .entries
                .map((step) => Text(
                      '${step.key + 1}. ${step.value}',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ))
                .toList(),
          ),
        ],
      )),
    );
  }
}
