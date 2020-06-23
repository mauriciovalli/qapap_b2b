import 'package:intl/intl.dart';
import 'package:qapaq_b2b/common/bloc/bloc.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/models/product_use_case.dart';

import 'product_state.dart';

class ProductBloc extends Bloc<ProductState> {
  final GetProductsUseCase _getProductsUseCase;

  List<ProductModel> _products;

  ProductBloc(this._getProductsUseCase) {
    changeState(ProductState.loading(searchTerm: ''));
  }

  void search(String searchTerm) {
    _getProductsUseCase.execute().then((products) {
      _products = products;
      changeState(ProductState.loaded(
          state.searchTerm, _mapCategoriesToState(products)));
    }).catchError((error) {
      changeState(
          ProductState.error(state.searchTerm, 'A network error has ocurred'));
    });
  }

  void searchByCategory(String searchTerm, int categoryId) {
    _getProductsUseCase.listByCategory(categoryId).then((products) {
      _products = products;
      changeState(ProductState.loaded(
          state.searchTerm, _mapCategoriesToState(products)));
    }).catchError((error) {
      changeState(
          ProductState.error(state.searchTerm, 'A network error has ocurrd'));
    });
  }

  List<ProductItemState> _mapCategoriesToState(List<ProductModel> products) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'es-ES');

    return products
        .map((product) => ProductItemState(product.id, product.name,
            product.image, product.categoryId, formatCurrency.format(product.oldPrice), formatCurrency.format(product.price)))
        .toList();
  }
}
