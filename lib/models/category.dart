import 'package:flutter/cupertino.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/any_image.dart';

class CategoryModel {
  int id;
  String name;
  AnyImage image;
  IconData icon;
  String iconName;

  CategoryModel({this.id, this.name, this.image, this.iconName, this.icon});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'] != null
            ? AnyImage.fromJson(json['image'])
            : AnyImage(src: 'img/no-image.png'),
        icon =
            CompanyIcons[json['icon'] != null ? json['icon'] : "scatter_plot"],
        iconName = json['icon'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image.toJson(),
        'icon': iconName,
      };
}
