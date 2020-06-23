import 'package:flutter/widgets.dart';

abstract class ProductState {
  final String searchTerm;

  ProductState(this.searchTerm);

  factory ProductState.loading({String searchTerm}) =>
      LoadingProductState(searchTerm: searchTerm);

  factory ProductState.loaded(
          String searchTerm, List<ProductItemState> items) =>
      LoadedProductState(searchTerm: searchTerm, items: items);

  factory ProductState.error(String searchTerm, String message) =>
      ErrorProductState(searchTerm: searchTerm, message: message);
}

class LoadingProductState extends ProductState {
  LoadingProductState({String searchTerm}) : super(searchTerm);
}

class LoadedProductState extends ProductState {
  final List<ProductItemState> items;

  LoadedProductState({String searchTerm, @required this.items})
      : super(searchTerm);
}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState({@required String searchTerm, @required this.message})
      : super(searchTerm);
}

class ProductItemState {
  final int id ;
  final String name ;
  final String image ;
  final int categoryId ;
  final String price ;
  final String oldPrice ;

  ProductItemState(this.id, this.name, this.image, this.categoryId, this.oldPrice, this.price);
}
