import 'package:flutter/material.dart';
import 'package:qapaq_b2b/models/product.dart';

class Products with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
      id: 1,
      name: 'Women Bag',
      image: 'img/products/womenbag.png',
      categoryId: 3,
      oldPrice: 120,
      price: 85.99,
    ),
    ProductModel(
      id: 2,
      name: 'Blazzer1',
      image: 'img/products/blazer1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 3,
      name: 'Blazzer2',
      image: 'img/products/blazer1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 4,
      name: 'Red Dress',
      image: 'img/products/dress1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 5,
      name: 'Dress',
      image: 'img/products/dress2.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85.99,
    ),
    ProductModel(
      id: 6,
      name: 'Hills',
      image: 'img/products/hills1.jpeg',
      categoryId: 3,
      oldPrice: 100,
      price: 95,
    ),
    ProductModel(
      id: 7,
      name: 'Hills',
      image: 'img/products/hills2.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 8,
      name: 'Panet',
      image: 'img/products/pants2.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 95,
    ),
  ];

//  {
//    "name": "Panet",
//    "picture": "img/products/pants2.jpeg",
//    "old price": 120,
//    "price": 85
//  },
//  {
//    "name": "SKT",
//    "picture": "img/products/skt1.jpeg",
//    "old price": 120,
//    "price": 85
//  },
//  {
//    "name": "SKT",
//    "picture": "img/products/skt1.jpeg",
//    "old price": 120,
//    "price": 85
//  },
//];

  List<ProductModel> get items {
    return [..._items];
  }

  ProductModel findById(int id) {
    return _items.firstWhere((p) => p.id == id);
  }

  List<ProductModel> listByCategoryId(int id) {
    return _items.where((product) => product.categoryId == id).toList();
  }
}
