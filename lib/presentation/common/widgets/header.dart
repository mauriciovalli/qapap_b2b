import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/dependencies_provider.dart';
import 'package:qapaq_b2b/services/category_repository.dart';
import 'package:qapaq_b2b/services/product_repository.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class MyAppBar {
  static Widget appBar(
      TextEditingController searchController, BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    var titleWiget = _TitleWiget(textController: searchController);

    return AppBar(
      elevation: 0.1,
      title: titleWiget,
      actions: themeConfig.isDesktop && !themeConfig.isSmallDesktop
          ? titleWiget.buildActions(context)
          : [],
    );
  }
}

class _TitleWiget extends StatelessWidget {
  final TextEditingController textController;

  const _TitleWiget({Key key, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return Container(
        padding: EdgeInsets.symmetric(
          vertical: themeConfig.appPaddingVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, 0, themeConfig.appPaddingHorizontalLarge, 0),
                child: Image.asset(
                  themeConfig.isDesktop && !themeConfig.isSmallDesktop
                      ? 'img/logo_qapaq.png'
                      : 'img/logo_qapaq_small.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
              ),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  }),
            ),
          ],
        ));
  }

  List<Widget> buildActions(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final List<Widget> actions = [];

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("img/logo.jpeg"),
            radius: 14,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    ));

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalSmall, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Icon(
            Icons.message,
            color: Colors.white,
          ),
          Text(
            "Mensajes",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    ));

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalSmall, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Icon(
            Icons.content_paste,
            color: Colors.white,
          ),
          Text(
            "Ordenes",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    ));

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalSmall, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Text(
            "Carrito",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    ));

    return actions;
  }
}

class DataSearch extends SearchDelegate<String> {
  final CategoryRepository _repository = getIt<CategoryRepository>();
  final ProductRepository _repositoryP = getIt<ProductRepository>();

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
