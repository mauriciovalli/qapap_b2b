part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoad extends ProductEvent {
  final int categoyId;

  const ProductLoad(this.categoyId);

  @override
  List<Object> get props => [];
}

class ProductHide extends ProductEvent {
  @override
  List<Object> get props => [];
}
