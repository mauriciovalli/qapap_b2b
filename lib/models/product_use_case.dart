import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/models/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<ProductModel>> execute() {
    return _productRepository.get();
  }

  Future<List<ProductModel>> listByCategory(int categoryId) {
    return _productRepository.listByCategoryId(categoryId);
  }
}
