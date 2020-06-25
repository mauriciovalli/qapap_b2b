import 'category.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> get();
  List<CategoryModel> list();
  CategoryModel findByName(String name);
}
