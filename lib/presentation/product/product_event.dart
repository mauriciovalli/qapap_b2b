part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoadEvent extends ProductEvent {
  final int categoyId;

  const ProductLoadEvent(this.categoyId);

  @override
  List<Object> get props => [];
}

class ProductHideEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}
