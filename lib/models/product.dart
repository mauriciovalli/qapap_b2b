import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/models/company.dart';

class ProductModel {
  int id;
  String name;
  String description;
  CompanyModel company;
  int categoryId;
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
      this.categoryId,
      this.priceMin,
      this.priceMax,
      this.orderUnit='Kg',
      this.orderMin=10,
      this.incoTerms='FOP',
      this.images});

  @override
  toString() => "productId: $id , productName: $name";
}
