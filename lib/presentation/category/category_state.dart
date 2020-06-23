import 'package:flutter/widgets.dart';

abstract class CategoryState {
  final String searchTerm;

  CategoryState(this.searchTerm);

  factory CategoryState.loading({String searchTerm}) =>
      LoadingCategoryState(searchTerm: searchTerm);

  factory CategoryState.loaded(
          String searchTerm, List<CategoryItemState> items) =>
      LoadedCategoryState(searchTerm: searchTerm, items: items);

  factory CategoryState.error(String searchTerm, String message) =>
      ErrorCategoryState(searchTerm: searchTerm, message: message);
}

class LoadingCategoryState extends CategoryState {
  LoadingCategoryState({String searchTerm}) : super(searchTerm);
}

class LoadedCategoryState extends CategoryState {
  final List<CategoryItemState> items;

  LoadedCategoryState({String searchTerm, @required this.items})
      : super(searchTerm);
}

class ErrorCategoryState extends CategoryState {
  final String message;

  ErrorCategoryState({@required String searchTerm, @required this.message})
      : super(searchTerm);
}

class CategoryItemState {
  final int id;
  final String name;
  final String image;
  CategoryItemState(this.id, this.name, this.image);
}
