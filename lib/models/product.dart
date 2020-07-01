import 'package:qapaq_b2b/models/any_image.dart';

class ProductModel {
  int id;
  String name;
  int categoryId;
  double priceMin;
  double priceMax;
  List<AnyImage> images;

  ProductModel(
      {this.id,
      this.name,
      this.categoryId,
      this.priceMin,
      this.priceMax,
      this.images});

  @override
  toString() => "productId: $id , productName: $name";
}
