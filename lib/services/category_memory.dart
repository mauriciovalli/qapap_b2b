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
    "name": "Veiculos & Accesorios",
    "image": "img/cats/cars.jpg",
    "icon": "0xe268"
  },
  {
    "id": 3,
    "name": "Comidas & Bebidas",
    "image": "img/cats/food_beverages.jpg",
    "icon": "0xe268"
  },
  {
    "id": 4,
    "name": "Pescados & carnes",
    "image": "",
    "icon": "0xe268"
  },
  {
    "id": 5,
    "name": "Maquinaria & Electrónica",
    "image": "img/cats/electronics.jpg",
    "icon": "0xe268"
  },
  {
    "id": 6,
    "name": "Materiales & Minerales",
    "image": "",
    "icon": "0xe268"
  },
  {
    "id": 7,
    "name": "Envios & Logistica",
    "image": "",
    "icon": "0xe268"
  },
  {
    "id": 8,
    "name": "Suministros Médicos",
    "image": "",
    "icon": "0xe268"
  },
  {
    "id": 9,
    "name": "Textiles",
    "image": "img/cats/crafts.jpg",
    "icon": "0xe268"
  },
  {
    "id": 10,
    "name": "Consultoría",
    "image": "",
    "icon": "0xe268"
  }
]''';

class CategoryInMemoryRepository implements CategoryRepository {
  @override
  List<CategoryModel> list() {
    return _parse(jsonDecode(categoriesJson));
  }

  @override
  List<CategoryModel> listByName(String pattern) {
   return _parse(jsonDecode(categoriesJson)).where((element) => element.name.toLowerCase().contains(pattern.toLowerCase())).toList();
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
