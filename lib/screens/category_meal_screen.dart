import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../models/dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String catTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final Map<String, Object> routArgs =
          ModalRoute.of(context).settings.arguments;
      final catID = routArgs['id'];
      catTitle = routArgs['title'];
      displayedMeals = widget._availableMeals
          .where((meal) => meal.categories.contains(catID))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, idx) => MealItem(
            removeItem: _removeMeal,
            id: displayedMeals[idx].id,
            affordability: displayedMeals[idx].affordability,
            complexity: displayedMeals[idx].complexity,
            title: displayedMeals[idx].title,
            duration: displayedMeals[idx].duration,
            imageURL: displayedMeals[idx].imageUrl),
      ),
    );
  }
}
