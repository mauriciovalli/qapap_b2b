import 'package:flutter/material.dart';
import 'package:qapaq_b2b/models/product.dart';

class Products with ChangeNotifier {
  List<ProductModel> _items = [
    ProductModel(
      id: 101,
      name: 'Norton Malbec Doc Caja 6x750ml',
      image: 'https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp',
      categoryId: 1,
      oldPrice: 300,
      price: 300,
    ),
    ProductModel(
      id: 301,
      name: 'Women Bag',
      image: 'img/products/womenbag.png',
      categoryId: 3,
      oldPrice: 120,
      price: 85.99,
    ),
    ProductModel(
      id: 302,
      name: 'Blazzer1',
      image: 'img/products/blazer1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 303,
      name: 'Blazzer2',
      image: 'img/products/blazer1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 304,
      name: 'Red Dress',
      image: 'img/products/dress1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 305,
      name: 'Dress',
      image: 'img/products/dress2.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85.99,
    ),
    ProductModel(
      id: 306,
      name: 'Hills',
      image: 'img/products/hills1.jpeg',
      categoryId: 3,
      oldPrice: 100,
      price: 95,
    ),
    ProductModel(
      id: 307,
      name: 'Hills',
      image: 'img/products/hills2.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 85,
    ),
    ProductModel(
      id: 308,
      name: 'Panet',
      image: 'img/products/pants2.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 95,
    ),
    ProductModel(
      id: 309,
      name: 'SKT',
      image: 'img/products/skt1.jpeg',
      categoryId: 3,
      oldPrice: 120,
      price: 95,
    ),
  ];

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
