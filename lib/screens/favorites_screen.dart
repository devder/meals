import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return _favoriteMeals.isEmpty
        ? Center(child: Text('You have no favorites yet - add some!'))
        : ListView.builder(
            itemCount: _favoriteMeals.length,
            itemBuilder: (ctx, idx) => MealItem(
                id: _favoriteMeals[idx].id,
                affordability: _favoriteMeals[idx].affordability,
                complexity: _favoriteMeals[idx].complexity,
                title: _favoriteMeals[idx].title,
                duration: _favoriteMeals[idx].duration,
                imageURL: _favoriteMeals[idx].imageUrl),
          );
  }
}
