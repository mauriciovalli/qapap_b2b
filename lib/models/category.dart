import 'package:flutter/cupertino.dart';

class CategoryModel{
  int id ;
  String name ;
  String image ;
  IconData icon ;
  bool isSelected;
  CategoryModel({this.id,this.name,this.image,this.icon, this.isSelected=false});
}