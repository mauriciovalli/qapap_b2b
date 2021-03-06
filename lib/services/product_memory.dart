import 'dart:convert';

import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/services/product_repository.dart';

const products = '''[
  {
     "id": 101,
     "name": "Alfalfa",
     "category": 
        {
          "id": 1,
          "name": "Produción Agricola",
          "image": { "src": "https://cdn.fromozz.com/PROCHILE/images/category/Agriculture%20and%20Live%20Animals.jpg" },
          "icon": "wheat"
        },
     "priceMax": 8.0,
     "priceMin": 12.0,   
     "images": [
       {
          "src": "https://cdn.fromozz.com/16e0726977c3b3589f99487832bac3ca6348771c/e39de292cb382df369f91c33642d201cb3d44a64/thumbnail.jpg"
       },
       {
          "src": "https://cdn.fromozz.com/16e0726977c3b3589f99487832bac3ca6348771c/d8f1b7fd398494211f4c1b01a24e98b97a3d87a7/thumbnail.jpg"
       },
       {
          "src": "https://cdn.fromozz.com/16e0726977c3b3589f99487832bac3ca6348771c/f5f282ba746bbb57cbf0e165f042acda51bef7b2/thumbnail.jpg"
       }
     ]
  },
  {
     "id": 102,
     "name": "Harina de Avena",
     "category": 
        {
          "id": 1,
          "name": "Produción Agricola",
          "image": { "src": "https://cdn.fromozz.com/PROCHILE/images/category/Agriculture%20and%20Live%20Animals.jpg" },
          "icon": "wheat"
        },
     "priceMax": 450.00,
     "priceMin": 500.00,
     "images": [
       {
          "src": "https://cdn.fromozz.com/5924464f7f5c2e677e38a6a6b3561cffc9897330/70286176083c87328d5c166580bdaf4ff08eda9e/thumbnail.jpg"
       }
     ]
  },
  {
     "id": 201,
     "name": "Tractor CAT",
     "category": 
        {
          "id": 2,
          "name": "Veiculos & Accesorios",
          "image": { "src": "https://cdn.fromozz.com/fd0e7788594364c083b92f248c892b3966da1c60/873c20d665abe3d72fd5bf73fa675c24db2026b1/thumbnail.jpg" },
          "icon": "truck"
        },
     "priceMax": 10000.0,
     "priceMin": 50000.0,
     "images": [
       {
          "src": "https://cdn.fromozz.com/fd0e7788594364c083b92f248c892b3966da1c60/495d00c724052d8dac0df3b75c7a7fb413c32be4/thumbnail.jpg"
       }
     ]
  },
  {
     "id": 301,
     "name": "Norton Malbec Doc Caja 6x750ml",
     "category": 
        {
          "id": 3,
          "name": "Comidas & Bebidas",
          "image": { "src": "img/cats/food_beverages.jpg" },
          "icon": "wine"
        },
     "priceMax": 300.0,
     "priceMin": 300.0,
     "images": [
       {
          "src": "https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp"
       }
    ] 
  },
  {
     "id": 401,
     "name": "Salmon fresco del Atlanticol",
     "category": 
       {
          "id": 4,
          "name": "Pescados & carnes"
       },
     "priceMax": 10.0,
     "priceMin": 1000.0,
     "images": [
       {
          "src": "https://cdn.fromozz.com/4c80b948ae8dc57b8a1c7903892c6c72cfa0ec6b/4864ac020ad00ab87ef6ba3f644ef77725f00a7f/thumbnail.jpg"
       },
       {
          "src": "https://cdn.fromozz.com/4c80b948ae8dc57b8a1c7903892c6c72cfa0ec6b/efa18fa534c62b7c17b0ccde12573c0d1c0c8808/thumbnail.jpg"
       },
       {
          "src": "https://cdn.fromozz.com/4c80b948ae8dc57b8a1c7903892c6c72cfa0ec6b/8eabaa604d96e3518cdf4081725b94f470a78b78/thumbnail.jpg"
       }
    ] 
  }
]''';

class ProductInMemoryRepository implements ProductRepository {
  @override
  Future<List<ProductModel>> listByCategoryId(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
    List<ProductModel> _items = _parse(jsonDecode(products));
    List<ProductModel> filterList =
        _items.where((product) => product.category.id == id).toList();
    return filterList;
  }

  // ignore: unused_element
  List<ProductModel> _parse(List<dynamic> json) {
    return json.map((jsonItem) => ProductModel.fromJson(jsonItem)).toList();
  }

  @override
  Future<ProductModel> findById(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
    List<ProductModel> _items = _parse(jsonDecode(products));
    return _items.firstWhere((p) => p.id == id);
  }

//class Products {
//  List<ProductModel> _items = [
//    ProductModel(
//      id: 101,
//      name: 'Norton Malbec Doc Caja 6x750ml',
//      image:
//          'https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp',
//      categoryId: 1,
//      priceMax: 300,
//      priceMin: 300,
//    ),
//    ProductModel(
//      id: 301,
//      name: 'Women Bag',
//      image: 'img/products/womenbag.png',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 85.99,
//    ),
//    ProductModel(
//      id: 302,
//      name: 'Blazzer1',
//      image: 'img/products/blazer1.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 85,
//    ),
//    ProductModel(
//      id: 303,
//      name: 'Blazzer2',
//      image: 'img/products/blazer1.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 85,
//    ),
//    ProductModel(
//      id: 304,
//      name: 'Red Dress',
//      image: 'img/products/dress1.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 85,
//    ),
//    ProductModel(
//      id: 305,
//      name: 'Dress',
//      image: 'img/products/dress2.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 85.99,
//    ),
//    ProductModel(
//      id: 306,
//      name: 'Hills',
//      image: 'img/products/hills1.jpeg',
//      categoryId: 3,
//      priceMax: 100,
//      priceMin: 95,
//    ),
//    ProductModel(
//      id: 307,
//      name: 'Hills',
//      image: 'img/products/hills2.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 85,
//    ),
//    ProductModel(
//      id: 308,
//      name: 'Panet',
//      image: 'img/products/pants2.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 95,
//    ),
//    ProductModel(
//      id: 309,
//      name: 'SKT',
//      image: 'img/products/skt1.jpeg',
//      categoryId: 3,
//      priceMax: 120,
//      priceMin: 95,
//    ),
//  ];
//
//  List<ProductModel> get items {
//    return [..._items];
//  }
//
//  ProductModel findById(int id) {
//    return _items.firstWhere((p) => p.id == id);
//  }
//
//  List<ProductModel> listByCategoryId(int id) {
//    return _items.where((product) => product.categoryId == id).toList();
//  }
}
