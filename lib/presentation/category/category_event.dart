part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryLoadEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class CategoryHideEvent extends CategoryEvent {
  @override
  List<Object> get props => [];
}
