import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/services/any_image_repository.dart';

abstract class CategoryRepository {
  List<CategoryModel> list();
  List<CategoryModel> listByName(String pattern);

  CategoryModel findByName(String name);

  static CategoryModel parseCategory(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'] != null
            ? AnyImageRepository.parseImage(json['image'])
            : AnyImage(src: 'img/no-image.png'),
        icon:
            CompanyIcons[json['icon'] != null ? json['icon'] : "scatter_plot"]);
  }
}
