import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme_config.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class CategorySimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    return Container(
      height: 30,
      color: Colors.redAccent,
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
                if (state is CategorySHide) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 30,
                      color: Colors.redAccent,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.length(),
                          itemBuilder: (context, index) {
                            return CategoryItem(
                                state.getByPosition(index), themeConfig);
                          }),
                    ),
                  );
                }
                if (state is CategoryLoaded) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 30,
                      color: Colors.redAccent,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.length(),
                          itemBuilder: (context, index) {
                            return CategoryItem(
                                state.getByPosition(index), themeConfig);
                          }),
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
}

class CategoryItem extends StatelessWidget {
  final CategoryModel _item;
  final ThemeConfig themeConfig;
  const CategoryItem(this._item, this.themeConfig);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: themeConfig.appPaddingHorizontalSmall,
          ),
          child: Text(
            _item.name,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: Colors.white),
          ),
        ),
        onTap: () => {
          BlocProvider.of<CategoryBloc>(context).add(CategoryHide()),
          BlocProvider.of<ProductBloc>(context).add(ProductLoad(_item.id)),
            });
  }
}
