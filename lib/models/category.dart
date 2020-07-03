import 'package:flutter/cupertino.dart';
import 'package:qapaq_b2b/models/any_image.dart';

class CategoryModel {
  int id;
  String name;
  AnyImage image;
  IconData icon;
  bool isSelected;
  CategoryModel(
      {this.id, this.name, this.image, this.icon, this.isSelected = false});
}
