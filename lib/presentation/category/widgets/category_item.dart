import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel _item;

  const CategoryItem(this._item);

  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return InkWell(
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Container(
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            child: buildTitle(_item.name, themeConfig),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: _item.image.src.startsWith("http")
                      ? NetworkImage(_item.image.src)
                      : _item.image.src.length > 0
                          ? AssetImage(_item.image.src)
                          : AssetImage('img/no-image.png'),
                  fit: BoxFit.cover)),
        ),
      ),
      onTap: () => {
        BlocProvider.of<CategoryBloc>(context).add(CategoryHideEvent()),
        BlocProvider.of<ProductBloc>(context).add(ProductLoadEvent(_item.id)),
      },
    );
  }

  Widget buildTitle(String title, ThemeConfig themeConfig) {
    return Center(
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: themeConfig.titleFontSize),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Colors.white, style: BorderStyle.solid)),
      ),
    );
  }
}
