import 'dart:convert';

import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/services/product_repository.dart';

const products = '''[
  {
     "id": 101,
     "name": "Alfalfa",
     "categoryId": 1,
     "oldPrice": 8.0,
     "price": 12.0,   
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
     "categoryId": 1,
     "oldPrice": 450.00,
     "price": 500.00,
     "images": [
       {
          "src": "https://cdn.fromozz.com/5924464f7f5c2e677e38a6a6b3561cffc9897330/70286176083c87328d5c166580bdaf4ff08eda9e/thumbnail.jpg"
       }
     ]
  },
  {
     "id": 201,
     "name": "Tractor CAT",
     "categoryId": 2,
     "oldPrice": 10000.0,
     "price": 50000.0,
     "images": [
       {
          "src": "https://cdn.fromozz.com/fd0e7788594364c083b92f248c892b3966da1c60/495d00c724052d8dac0df3b75c7a7fb413c32be4/thumbnail.jpg"
       }
     ]
  },
  {
     "id": 301,
     "name": "Norton Malbec Doc Caja 6x750ml",
     "categoryId": 3,
     "oldPrice": 300.0,
     "price": 300.0,
     "images": [
       {
          "src": "https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp"
       }
    ] 
  }
]''';



class ProductInMemoryRepository implements ProductRepository {
  @override
  List<ProductModel> listByCategoryId(int id) {
    List<ProductModel> _items = _parse(jsonDecode(products));
    List<ProductModel> filterList =
        _items.where((product) => product.categoryId == id).toList();
    return filterList;
  }

  // ignore: unused_element
  List<ProductModel> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseProducts(jsonItem)).toList();
  }

  ProductModel _parseProducts(Map<String, dynamic> json) {
    //parse the product's images
    List<AnyImage> imagesOfProductList = [];

    json["images"].forEach(
      (newImage) {
        imagesOfProductList.add(
          new AnyImage(
            imageURL: newImage["src"],
            id: newImage["id"],
            title: newImage["name"],
            alt: "",//newImage["alt"],
          ),
        );
      },
    );

    return ProductModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
      priceMax: json['oldPrice'],
      priceMin: json['price'],
      images: imagesOfProductList,
    );
  }

//class Products {
//  List<ProductModel> _items = [
//    ProductModel(
//      id: 101,
//      name: 'Norton Malbec Doc Caja 6x750ml',
//      image:
//          'https://http2.mlstatic.com/vino-norton-malbec-doc-caja-6x750ml-D_NQ_NP_837477-MLA32009302454_082019-F.webp',
//      categoryId: 1,
//      oldPrice: 300,
//      price: 300,
//    ),
//    ProductModel(
//      id: 301,
//      name: 'Women Bag',
//      image: 'img/products/womenbag.png',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 85.99,
//    ),
//    ProductModel(
//      id: 302,
//      name: 'Blazzer1',
//      image: 'img/products/blazer1.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 85,
//    ),
//    ProductModel(
//      id: 303,
//      name: 'Blazzer2',
//      image: 'img/products/blazer1.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 85,
//    ),
//    ProductModel(
//      id: 304,
//      name: 'Red Dress',
//      image: 'img/products/dress1.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 85,
//    ),
//    ProductModel(
//      id: 305,
//      name: 'Dress',
//      image: 'img/products/dress2.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 85.99,
//    ),
//    ProductModel(
//      id: 306,
//      name: 'Hills',
//      image: 'img/products/hills1.jpeg',
//      categoryId: 3,
//      oldPrice: 100,
//      price: 95,
//    ),
//    ProductModel(
//      id: 307,
//      name: 'Hills',
//      image: 'img/products/hills2.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 85,
//    ),
//    ProductModel(
//      id: 308,
//      name: 'Panet',
//      image: 'img/products/pants2.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 95,
//    ),
//    ProductModel(
//      id: 309,
//      name: 'SKT',
//      image: 'img/products/skt1.jpeg',
//      categoryId: 3,
//      oldPrice: 120,
//      price: 95,
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
