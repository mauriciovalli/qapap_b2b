import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategorySHide) {
        return SizedBox(height: 0);
      } else {
        return Expanded(
          flex: 8,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 0)),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is CategoryLoaded) {
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300.0,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 10.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              CategoryItem(state.getByPosition(index)),
                          childCount: state.items.length,
                        ),
                      );
                    }
                    return Text('Something went wrong!');
                  },
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
