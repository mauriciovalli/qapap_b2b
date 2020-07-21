import 'dart:convert';

import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/services/category_repository.dart';

const categoriesJson = '''[
  {
    "id": 1,
    "name": "Produción Agricola",
    "image": { "src": "https://cdn.fromozz.com/PROCHILE/images/category/Agriculture%20and%20Live%20Animals.jpg" },
    "icon": "wheat"
  },
  {
    "id": 2,
    "name": "Vehiculos & Accesorios",
    "image": { "src": "https://cdn.fromozz.com/fd0e7788594364c083b92f248c892b3966da1c60/873c20d665abe3d72fd5bf73fa675c24db2026b1/thumbnail.jpg" },
    "icon": "truck"
  },
  {
    "id": 3,
    "name": "Comidas & Bebidas",
    "image": { "src": "img/cats/food_beverages.jpg" },
    "icon": "wine"
  },
  {
    "id": 4,
    "name": "Pescados & Carnes"
  },
  {
    "id": 5,
    "name": "Maquinaria & Electrónica",
    "image": { "src": "img/cats/electronics.jpg" }
  },
  {
    "id": 6,
    "name": "Materiales & Minerales",
    "image": { "src": "https://cdn.fromozz.com/PROCHILE/images/category/Minerals%20and%20Metallurgy.jpg" }
  },
  {
    "id": 7,
    "name": "Envios & Logistica"
  },
  {
    "id": 8,
    "name": "Suministros Médicos",
    "image": { "src": "https://cdn.fromozz.com/PROCHILE/images/category/Health%20And%20Medicine.jpg" }
  },
  {
    "id": 9,
    "name": "Textiles",
    "image": { "src": "img/cats/crafts.jpg" }
  },
  {
    "id": 10,
    "name": "Consultoría"
  }
]''';

class CategoryInMemoryRepository implements CategoryRepository {
  @override
  Future<List<CategoryModel>> list() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _parse(jsonDecode(categoriesJson));
  }

  @override
  Future<List<CategoryModel>> listByName(String pattern) async {
    await Future.delayed(Duration(milliseconds: 500));
    return _parse(jsonDecode(categoriesJson))
        .where((element) =>
            element.name.toLowerCase().contains(pattern.toLowerCase()))
        .toList();
  }

  @override
  Future<CategoryModel> findByName(String name) async {
    await Future.delayed(Duration(milliseconds: 500));
    return _parse(jsonDecode(categoriesJson))
        .firstWhere((p) => p.name.startsWith(name));
  }

  List<CategoryModel> _parse(List<dynamic> json) {
    return json.map((jsonItem) => CategoryModel.fromJson(jsonItem)).toList();
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
