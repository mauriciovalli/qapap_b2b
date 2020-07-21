import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryHideState) {
        return SizedBox(height: 0);
      } else if (state is CategoryLoadingState) {
        return Expanded(
          flex: 8,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is CategoryLoadedState) {
        return Expanded(
          flex: 8,
          child: CustomScrollView(slivers: [
            //SliverToBoxAdapter(child: SizedBox(height: 0)),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 10.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => CategoryItem(state.getByPosition(index)),
                childCount: state.items.length,
              ),
            ),
          ]),
        );
      } else {
        return Text('Something went wrong!');
      }
    });
  }
}
