import 'dart:convert';

import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/services/category_repository.dart';

const categoriesJson = '''[
  {
    "id": 1,
    "name": "Produción Agricola",
    "image": "img/cats/agriculture.jpg",
    "icon": "0xeb4c"
  },
  {
    "id": 2,
    "name": "Comida y Bebidas",
    "image": "img/cats/food_beverages.jpg",
    "icon": "0xe57a"
  },
  {
    "id": 3,
    "name": "Ropa y Calzado",
    "image": "img/cats/clothing.jpg",
    "icon": "0xe3f4"
  },
  {
    "id": 4,
    "name": "Productos para la Casa",
    "image": "img/cats/house.jpg",
    "icon": "0xe88a"
  },
  {
    "id": 5,
    "name": "Autos",
    "image": "img/cats/cars.jpg",
    "icon": "0xe531"
  },
  {
    "id": 6,
    "name": "Electrónica",
    "image": "img/cats/electronics.jpg",
    "icon": "0xe3f4"
  },
  {
    "id": 7,
    "name": "Juguetes y Juegos",
    "image": "img/cats/toys.jpg",
    "icon": "0xe3f4"
  },
  {
    "id": 8,
    "name": "Artesanías, Textiles y Costuras",
    "image": "img/cats/crafts.jpg",
    "icon": "0xe3f4"
  }
]''';

class CategoryInMemoryRepository implements CategoryRepository {
  @override
  List<CategoryModel> list() {
    return _parse(jsonDecode(categoriesJson));
  }

  @override
  CategoryModel findByName(String name) {
    return _parse(jsonDecode(categoriesJson)).firstWhere((p) => p.name.startsWith(name));
  }

  List<CategoryModel> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseCategory(jsonItem)).toList();
  }

  CategoryModel _parseCategory(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'], name: json['name'], image: json['image'], icon: json['icon']);
  }
}

//  List<CategoryModel> get items {
//    return [..._items];
//  }
//
//  CategoryModel findById(int id) {
//    return _items.firstWhere((p) => p.id == id);
//  }
//}
