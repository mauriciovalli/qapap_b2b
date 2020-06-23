import 'package:get_it/get_it.dart';
import 'package:qapaq_b2b/models/category_repository.dart';
import 'package:qapaq_b2b/models/category_use_case.dart';
import 'package:qapaq_b2b/models/product_repository.dart';
import 'package:qapaq_b2b/models/product_use_case.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';
import 'package:qapaq_b2b/services/category.dart';
import 'package:qapaq_b2b/services/product.dart';

final getIt = GetIt.instance;

void init() {
  registerCategoryDependencies();
  registerProductDependencies();
}

void registerProductDependencies() {
  getIt.registerFactory(() => ProductBloc(getIt()));
  getIt.registerLazySingleton(() => GetProductsUseCase(getIt()));
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductInMemoryRepository());
}

void registerCategoryDependencies() {
  getIt.registerFactory(() => CategoryBloc(getIt()));
  getIt.registerLazySingleton(() => GetCategoryUseCase(getIt()));
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryInMemoryRepository());
}
