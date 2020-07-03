import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/services/category_repository.dart';
import 'package:qapaq_b2b/services/any_image_repository.dart';

abstract class ProductRepository {
  List<ProductModel> listByCategoryId(int id);

  static ProductModel parseProducts(Map<String, dynamic> json) {
    //parse the product's images
    List<AnyImage> images = [];

    json["images"].forEach(
      (imagenJson) {
        images.add(AnyImageRepository.parseImage(imagenJson));
      },
    );

    var category = CategoryRepository.parseCategory(json["category"]);

    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: category,
      priceMax: json['priceMax'],
      priceMin: json['priceMin'],
      images: images,
    );
  }
}
