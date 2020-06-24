import 'dart:convert';

import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/models/product_repository.dart';

const products = '''[
  {
     "id": 101,
     "name": "Norton Malbec Doc Caja 6x750ml",
     "image": "https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp",
     "categoryId": 1,
     "oldPrice": 300.0,
     "price": 300.0   
  }
]''';

class ProductInMemoryRepository implements ProductRepository {
  @override
  Future<List<ProductModel>> get() async {
    return Future.delayed(
        const Duration(milliseconds: 100), () => _parse(jsonDecode(products)));
  }

  List<ProductModel> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseProducts(jsonItem)).toList();
  }

  ProductModel _parseProducts(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        categoryId: json['categoryId'],
        oldPrice: json['oldPrice'],
        price: json['price']);
  }

  @override
  List<ProductModel> listByCategoryId(int id) {
//    List<ProductModel> _items = _parse(jsonDecode(products));
//    List<ProductModel> filterList = _items.where((product) => product.categoryId == id).toList();
    return Products().listByCategoryId(id);
  }
}

class Products {
  List<ProductModel> _items = [
    ProductModel(
      id: 101,
      name: 'Norton Malbec Doc Caja 6x750ml',
      image:
          'https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp',
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
