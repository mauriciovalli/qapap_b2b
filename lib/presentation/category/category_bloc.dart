import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/services/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository = getIt<CategoryRepository>();
  List<CategoryModel> _items = [];

  @override
  CategoryState get initialState => CategoryLoading();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryHide) {
      yield* _clean(event);
    }
    if (event is CategoryLoad) {
      yield* _load();
    }
  }

  Stream<CategoryState> _clean(CategoryHide event) async* {
    yield CategoryHided(items: _items);
  }

  Stream<CategoryState> _load() async* {
    yield CategoryLoading();
    try {
      //await Future.delayed(Duration(seconds: 1));
      _items = _repository.list();
      yield CategoryLoaded(items: _items);
    } catch (_) {
      yield CategoryError();
    }
  }
}
