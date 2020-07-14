import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/services/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository = getIt<ProductRepository>();
  List<ProductModel> _items = [];

  ProductBloc() : super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is ProductHideEvent) {
      yield* _clean(event);
    } else if (event is ProductLoadEvent) {
      yield* _load(event);
    }
  }

  Stream<ProductState> _clean(ProductHideEvent event) async* {
    yield ProductSHide();
  }

  Stream<ProductState> _load(ProductLoadEvent event) async* {
    yield ProductLoading();
    try {
      _items = await _repository.listByCategoryId(event.categoyId);
      yield ProductLoaded(items: _items);
    } catch (error) {
      yield ProductErrorState(message: error.toString());
    }
  }
}
