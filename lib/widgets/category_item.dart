import 'package:flutter/material.dart';
import 'package:meals/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.title, this.color, this.id});

  void selectCategory(BuildContext context) {
    Navigator.pushNamed(context, '/catMealScreen',
        arguments: {'id': id, 'title': title});
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (ctx) => CategoryMealScreen(
    //               catID: id,
    //               catTitle: title,
    //             )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
