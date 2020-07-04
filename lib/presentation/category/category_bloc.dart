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
  CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryHideEvent) {
      yield* _clean(event);
    }
    if (event is CategoryLoadEvent) {
      yield* _load();
    }
  }

  Stream<CategoryState> _clean(CategoryHideEvent event) async* {
    yield CategoryHideState(items: _items);
  }

  Stream<CategoryState> _load() async* {
    yield CategoryLoadingState();
    try {
      _items = await _repository.list();
      yield CategoryLoadedState(items: _items);
    } catch (_) {
      yield CategoryErrorState();
    }
  }
}
