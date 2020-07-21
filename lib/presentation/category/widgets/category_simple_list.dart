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
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoadingState) {
        return SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is CategoryHideState) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => buildItem(context, state.getByPosition(index)),
            childCount: state.items.length,
          ),
        );
      }
      if (state is CategoryLoadedState) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => buildItem(context, state.getByPosition(index)),
            childCount: state.items.length,
          ),
        );
      }
      return Text('Something went wrong!');
    });
  }

  Widget buildItem(BuildContext context, CategoryModel _item) {
    return Material(
      color: Colors.grey[200],
      child: ListTile(
        title: Row(
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
        onTap: () => {
          BlocProvider.of<CategoryBloc>(context).add(CategoryHideEvent()),
          BlocProvider.of<ProductBloc>(context).add(ProductLoadEvent(_item.id)),
          setState(() {
            _selectedItemId = _item.id;
          }),
        },
        selected: _selectedItemId == _item.id,
        selectedTileColor: CompanyColors.red[800],
        hoverColor: Colors.grey[400],
      ),
    );
  }
}
