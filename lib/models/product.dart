import 'package:flutter/material.dart';
import 'package:qapaq_b2b/layout/single_product.dart';

class ProductModel{
  int id ;
  String name ;
  String image ;
  int categoryId ;
  double price ;
  double oldPrice ;
  ProductModel({this.id,this.name,this.image,this.categoryId,this.price,this.oldPrice});
}