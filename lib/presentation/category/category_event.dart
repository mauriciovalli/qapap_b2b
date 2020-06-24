part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryLoad extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class CategoryHide extends CategoryEvent {
  @override
  List<Object> get props => [];
}
