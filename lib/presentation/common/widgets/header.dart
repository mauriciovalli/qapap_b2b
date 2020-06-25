import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header_actions.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';
import 'package:qapaq_b2b/services/category_repository.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return AppBar(
      //elevation: 0.1,
      title: _MyTittle(),
      actions: themeConfig.isDesktop && !themeConfig.isSmallDesktop
          ? MyActions().buildActions(context)
          : [],
      iconTheme: new IconThemeData(color: Colors.white),
    );
  }
}

class _MyTittle extends StatelessWidget {
  final TextEditingController textController;

  const _MyTittle({Key key, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return Container(
        padding: EdgeInsets.symmetric(
          vertical: themeConfig.appPaddingVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset(
                themeConfig.isDesktop && !themeConfig.isSmallDesktop
                    ? 'img/logo_qapaq.png'
                    : 'img/logo_qapaq_small.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            Container(
              child: IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    showSearch(context: context, delegate: _DataSearch());
                  }),
            ),
          ],
        ));
  }
}

class _DataSearch extends SearchDelegate<String> {
  final CategoryRepository _repository = getIt<CategoryRepository>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {});
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? _repository.list()
        : _repository
            .list()
            .where((element) => element.name.startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          var categorySelected =
              _repository.findByName(suggestionList[index].name);
          BlocProvider.of<CategoryBloc>(context).add(CategoryHide());
          BlocProvider.of<ProductBloc>(context)
              .add(ProductLoad(categorySelected.id));
          close(context, null);
        },
        leading: Icon(Icons.local_airport),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].name.substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].name.substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
