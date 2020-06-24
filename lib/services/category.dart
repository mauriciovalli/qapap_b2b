import 'dart:convert';

import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/models/category_repository.dart';

const categoriesJson = '''[
  {
    "id": 1,
    "name": "Alimentos y Bebidasl",
    "image": "img/cats/food_beverages.jpg"
  },
  {
    "id": 2,
    "name": "Agricultura y Animales Vivos",
    "image": "img/cats/agriculture.jpg"
  },
  {
    "id": 3,
    "name": "Ropa y Calzado",
    "image": "img/cats/clothing.jpg"
  },
  {
    "id": 4,
    "name": "Productos para la Casa",
    "image": "img/cats/house.jpg"
  },
  {
    "id": 5,
    "name": "Autos",
    "image": "img/cats/cars.jpg"
  },
  {
    "id": 6,
    "name": "Electrónica",
    "image": "img/cats/electronics.jpg"
  },
  {
    "id": 7,
    "name": "Juguetes y Juegos",
    "image": "img/cats/toys.jpg"
  },
  {
    "id": 8,
    "name": "Artesanías, Textiles y Costuras",
    "image": "img/cats/crafts.jpg"
  }
]''';

class CategoryInMemoryRepository implements CategoryRepository {
  @override
  Future<List<CategoryModel>> get() async {
    return Future.delayed(const Duration(milliseconds: 100),
            () => _parse(jsonDecode(categoriesJson)));
  }

  @override
  List<CategoryModel> list() {
    return _parse(jsonDecode(categoriesJson));
  }

  List<CategoryModel> _parse(List<dynamic> json) {
    return json.map((jsonItem) => _parseCategory(jsonItem)).toList();
  }

  CategoryModel _parseCategory(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'], name: json['name'], image: json['image']);
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
