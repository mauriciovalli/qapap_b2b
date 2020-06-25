import 'package:get_it/get_it.dart';
import 'package:qapaq_b2b/services/category_repository.dart';
import 'package:qapaq_b2b/services/product_repository.dart';
import 'package:qapaq_b2b/services/category_memory.dart';
import 'package:qapaq_b2b/services/product_memory.dart';

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
