import 'package:bloc/bloc.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/models/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository = getIt<ProductRepository>();
  List<ProductModel> _items = [];

  @override
  ProductState get initialState => ProductLoading();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is ProductHide) {
      yield* _clean(event);
    } else if (event is ProductLoad) {
      yield* _load(event);
    }
  }

  Stream<ProductState> _clean(ProductHide event) async* {
    yield ProductSHide();
  }
  
  Stream<ProductState> _load(ProductLoad event) async* {
    yield ProductLoading();
    try {
      await Future.delayed(Duration(seconds: 1));
      _items = _repository.listByCategoryId(event.categoyId);
      yield ProductLoaded(items: _items);
    } catch (_) {
      yield ProductError();
    }
  }
}
