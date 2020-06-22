import 'package:flutter/material.dart';

class CategoryModel{
  int id ;
  String name ;
  String image ;
  bool isSelected ;
  CategoryModel({this.id,this.name,this.isSelected = false,this.image});
}