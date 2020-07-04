import 'package:qapaq_b2b/models/category.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> list();
  Future<List<CategoryModel>> listByName(String pattern);

  Future<CategoryModel> findByName(String name);
}
