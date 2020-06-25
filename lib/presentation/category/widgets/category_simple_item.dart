import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

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
            vertical: 10,
            horizontal: 5,
          ),
          child: Text(
            _item.name,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        onTap: () => {
              BlocProvider.of<CategoryBloc>(context).add(CategoryHide()),
              BlocProvider.of<ProductBloc>(context).add(ProductLoad(_item.id)),
            });
  }
}
