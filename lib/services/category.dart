import 'package:flutter/material.dart';
import 'package:qapaq_b2b/models/category.dart';

class Categories with ChangeNotifier {
  List<CategoryModel> _items = [
    CategoryModel(
      id: 1,
      name: 'Alimentos y Bebidas',
      image: 'img/cats/food_beverages.jpg',
    ),
    CategoryModel(
      id: 2,
      name: 'Agricultura y Animales Vivos',
      image: 'img/cats/agriculture.jpg',
    ),
    CategoryModel(
      id: 3,
      name: 'Ropa y Calzado',
      image: 'img/cats/clothing.jpg',
    ),
    CategoryModel(
      id: 4,
      name: 'Productos para la Casa',
      image: 'img/cats/house.jpg',
    ),
    CategoryModel(
      id: 5,
      name: 'Autos',
      image: 'img/cats/cars.jpg',
    ),
    CategoryModel(
      id: 6,
      name: 'Electrónica',
      image: 'img/cats/electronics.jpg',
    ),
    CategoryModel(
      id: 7,
      name: 'Juguetes y Juegos',
      image: 'img/cats/toys.jpg',
    ),
    CategoryModel(
      id: 8 ,
      name: 'Alimentos y Bebidas',
      image: 'img/cats/food_beverages.jpg',
    ),
  ];

  List<CategoryModel> get items {
    return [..._items];
  }

  CategoryModel findById(int id) {
    return _items.firstWhere((p) => p.id == id);
  }


}
