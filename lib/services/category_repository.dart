import 'package:qapaq_b2b/models/category.dart';

abstract class CategoryRepository {
  List<CategoryModel> list();
  List<CategoryModel> listByName(String pattern);

  CategoryModel findByName(String name);
}
