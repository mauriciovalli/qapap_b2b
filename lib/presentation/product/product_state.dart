part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductSHide extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> items;

  const ProductLoaded({this.items});

  @override
  List<Object> get props => [items];

  ProductModel getByPosition(int position) => items[position];
}

class ProductError extends ProductState {
  @override
  List<Object> get props => [];
}
