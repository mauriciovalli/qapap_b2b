part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();
}

@immutable
abstract class CategoryListState extends CategoryState {
  const CategoryListState();

  CategoryModel getByPosition(int position);

  int length();
}

class CategoryHideState extends CategoryListState {
  final List<CategoryModel> items;

  const CategoryHideState({this.items});

  @override
  List<Object> get props => [items];

  @override
  CategoryModel getByPosition(int position) =>
      position < items.length ? items[position] : null;

  @override
  int length() {
    return items.length;
  }
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryListState {
  final List<CategoryModel> items;

  const CategoryLoadedState({this.items});

  @override
  List<Object> get props => [items];

  @override
  CategoryModel getByPosition(int position) =>
      position < items.length ? items[position] : null;

  @override
  int length() {
    return items.length;
  }
}

class CategoryErrorState extends CategoryState {
  @override
  List<Object> get props => [];
}
