import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Container(
      color: _selectedItemId == _item.id
          ? Theme.of(context).accentColor
          : Colors.transparent,
      child: ListTile(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                IconData(int.parse(_item.icon), fontFamily: 'MaterialIcons'),
                color: _selectedItemId == _item.id
                    ? Colors.white
                    : Theme.of(context).accentColor,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  _item.name,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: _selectedItemId == _item.id
                          ? Colors.white
                          : Colors.black),
                  textAlign: TextAlign.left,
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
    );
  }
}
