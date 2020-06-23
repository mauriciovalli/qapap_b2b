import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/models/category_use_case.dart';
import 'package:qapaq_b2b/common/bloc/bloc.dart';

import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryState> {
  final GetCategoryUseCase _getCategoriesUseCase;

  List<CategoryModel> _categories;

  CategoryBloc(
      this._getCategoriesUseCase) {
    changeState(CategoryState.loading(searchTerm: ''));
  }

  void search(String searchTerm) {
    _getCategoriesUseCase.execute().then((categories) {
      _categories = categories;
      changeState(CategoryState.loaded(state.searchTerm, _mapCategoriesToState(categories)));
    }).catchError((error) {
      changeState(
          CategoryState.error(state.searchTerm, 'A network error has ocurrd'));
    });
  }

  List<CategoryItemState> _mapCategoriesToState(List<CategoryModel> categories) {
    //inal formatCurrency = NumberFormat.simpleCurrency(locale: 'es-ES');

    return categories
        .map((category) => CategoryItemState(category.id, category.name, category.image))
        .toList();
  }
}
