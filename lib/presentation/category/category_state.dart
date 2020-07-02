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

class CategoryHided extends CategoryListState {
  final List<CategoryModel> items;

  const CategoryHided({this.items});

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

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryListState {
  final List<CategoryModel> items;

  const CategoryLoaded({this.items});

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

class CategoryError extends CategoryState {
  @override
  List<Object> get props => [];
}
