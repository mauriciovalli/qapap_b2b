import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/models/company.dart';

class ProductModel {
  int id;
  String name;
  String description;
  CompanyModel company;
  CategoryModel category;
  double priceMin;
  double priceMax;
  String orderUnit;
  int orderMin;
  String incoTerms;
  List<AnyImage> images;

  ProductModel(
      {this.id,
      this.name,
      this.company,
      this.category,
      this.priceMin,
      this.priceMax,
      this.orderUnit,
      this.orderMin,
      this.incoTerms,
      this.images});

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        images = _parseImage(json['images']),
        this.company = CompanyModel(),
        category = CategoryModel.fromJson(json["category"]),
        priceMax = json['priceMax'],
        priceMin = json['priceMin'],
        this.orderUnit = 'Kg',
        this.orderMin = 10,
        this.incoTerms = 'FOP';

  static List<AnyImage> _parseImage(Map<String, dynamic> json) {
    //parse the product's images
    List<AnyImage> images = [];
    json["images"].forEach(
      (imagenJson) {
        images.add(AnyImage.fromJson(imagenJson));
      },
    );
    return images;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        //? 'image': image..toJson(),
      };

  @override
  toString() => "productId: $id , productName: $name";
}
