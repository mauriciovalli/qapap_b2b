import 'package:qapaq_b2b/models/category.dart';

abstract class CategoryRepository {
  List<CategoryModel> list();

  CategoryModel findByName(String name);
}
