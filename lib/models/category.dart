import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  //this means that the properties of this objects can be changed after creation
  const Category({this.id, this.color = Colors.orange, this.title});
}
