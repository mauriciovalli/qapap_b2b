import 'package:get_it/get_it.dart';
import 'package:qapaq_b2b/models/category_repository.dart';
import 'package:qapaq_b2b/models/product_repository.dart';
import 'package:qapaq_b2b/services/category.dart';
import 'package:qapaq_b2b/services/product.dart';

final getIt = GetIt.instance;

void init() {
  registerCategoryDependencies();
  registerProductDependencies();
}

void registerProductDependencies() {
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductInMemoryRepository());
}

void registerCategoryDependencies() {
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryInMemoryRepository());
}
