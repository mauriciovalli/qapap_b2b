import 'package:flutter/material.dart';

class CategoryModel {
  var _categoryList = [
    {
      'title': 'Alimentos y Bebidas',
      'img': 'img/cats/food_beverages.jpg',
    },
    {
      'title': 'Agricultura y Animales Vivos',
      'img': 'img/cats/agriculture.jpg',
    },
    {
      'title': 'Ropa y Calzado',
      'img': 'img/cats/clothing.jpg',
    },
    {
      'title': 'Productos para la Casa',
      'img': 'img/house.jpg',
    },
    {
      'title': 'Autos',
      'img': 'img/cars.jpg',
    },
    {
      'title': 'Electrónica',
      'img': 'img/electronics.jpg',
    },
    {
      'title': 'Juguetes y Juegos',
      'img': 'img/cats/toys.jpg',
    },
  ];

  get categoryList => _categoryList;
}