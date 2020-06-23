import 'package:flutter/material.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/category/category_state.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final CategoryBloc _bloc;

  CategoryList() : _bloc = getIt<CategoryBloc>() {
    _bloc.search('Elements');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CategoryState>(
      initialData: _bloc.state,
      stream: _bloc.observableState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is LoadingCategoryState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorCategoryState) {
          return Center(child: Text(state.message));
        } else {
          return _renderCartegoryList(context, state);
        }
      },
    );
  }

  Widget _renderCartegoryList(
      BuildContext context, LoadedCategoryState state) {
    return GridView.builder(
      itemCount: state.items.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.0,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final CategoryItemState category = state.items[index];

        return CategoryItem(category);
      },
    );
  }
}
