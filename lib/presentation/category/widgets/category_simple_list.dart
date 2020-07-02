import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/category.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class CategorySimpleList extends StatefulWidget {
  @override
  CategorySimpleListState createState() => CategorySimpleListState();
}

class CategorySimpleListState extends State<CategorySimpleList> {
  int _selectedItemId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is CategoryHided) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        buildItem(context, state.getByPosition(index)),
                    childCount: state.items.length,
                  ),
                );
              }
              if (state is CategoryLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        buildItem(context, state.getByPosition(index)),
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

  Widget buildItem(BuildContext context, CategoryModel _item) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50.0, minHeight: 40.0),
      child: Container(
        color: _selectedItemId == _item.id
            ? CompanyColors.red[800]
            : Colors.transparent,
        child: ListTile(
          title: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(
                themeConfig.isDesktop && !themeConfig.isSmallDesktop ? 60 : 0,
                0,
                0,
                0),
            child: Row(
              children: [
                Icon(
                  _item.icon,
                  color: _selectedItemId == _item.id
                      ? Colors.white
                      : Theme.of(context).accentColor,
                  size: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    _item.name,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: _selectedItemId == _item.id
                            ? Colors.white
                            : Colors.grey[800]),
                  ),
                )
              ],
            ),
          ),
          onTap: () => {
            BlocProvider.of<CategoryBloc>(context).add(CategoryHide()),
            BlocProvider.of<ProductBloc>(context).add(ProductLoad(_item.id)),
            setState(() {
              _selectedItemId = _item.id;
            }),
          },
          selected: _selectedItemId == _item.id,
        ),
      ),
    );
  }
}
