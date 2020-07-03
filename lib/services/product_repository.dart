import 'package:qapaq_b2b/models/product.dart';

abstract class ProductRepository {
  List<ProductModel> listByCategoryId(int id);
}
