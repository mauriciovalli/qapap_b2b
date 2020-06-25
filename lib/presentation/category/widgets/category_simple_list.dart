import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_simple_item.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class CategorySimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    return Scaffold(
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
              if (state is CategorySHide){
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                        CategoryItem(state.getByPosition(index), themeConfig),
                    childCount: state.items.length,
                  ),
                );
              }
              if (state is CategoryLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        CategoryItem(state.getByPosition(index), themeConfig),
                    childCount: state.items.length,
                  ),
                );
              }
              return Text('Something went wrong!');
            },
          ),
        ],
      ),
    );
  }
}
