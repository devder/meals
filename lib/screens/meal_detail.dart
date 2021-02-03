import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function _toggleFavorite;
  final Function _isFavorite;

  MealDetail(this._isFavorite, this._toggleFavorite);

  Widget _buildSectionTitle(BuildContext ctx, String titleText) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          titleText,
          style: Theme.of(ctx).textTheme.headline6,
        ),
      );

  Widget _buildContainer({Widget child}) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () => Navigator.pop(context, mealId),
        ),
        appBar: AppBar(
          title: Text(selectedMeal.title),
          actions: [
            IconButton(
                icon: Icon(
                  _isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () => _toggleFavorite(mealId))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                  child: ListView.builder(
                      itemCount: selectedMeal.ingredients.length,
                      itemBuilder: (_, idx) => Card(
                            color: Theme.of(context).accentColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(selectedMeal.ingredients[idx]),
                            ),
                          ))),
              _buildSectionTitle(context, 'Steps'),
              _buildContainer(
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, idx) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${idx + 1}'),
                        ),
                        title: Text(selectedMeal.steps[idx]),
                      ),
                      Divider()
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
