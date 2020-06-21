import 'package:flutter/material.dart';
import 'package:qapaq_b2b/category.dart';

import 'configuration/theme_config.dart';
import 'layout/header.dart';
import 'models/category.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  _HomeState createState() => _HomeState();
}

class _HomeState extends  State<Home> {
  // ignore: top_level_instance_getter
  var _categories = CategoryModel().categoryList;

  final TextEditingController searchController = new TextEditingController();
  ThemeConfig themeConfig;

  @override
  Widget build(BuildContext context) {
    this.themeConfig = ThemeConfig(context);

    return Scaffold(
        appBar:
        appBar(searchController, themeConfig, context),
        drawer: themeConfig.isDesktop && !themeConfig.isSmallDesktop
            ? null
            : buildDrawer(),
        body: MediaQuery.of(context).size.width < 1000
            ? buildBody()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  builSubHeader(),
                  Expanded(
                    child: buildBody(),
                  ),
                ],
              ));
  }

  Widget builSubHeader() {
    double heightContaner = 30.0;

    return Container(
      height: heightContaner,
      color: Colors.redAccent,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          // La línea a continuación hace el truco.
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, i) {
            return InkWell(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: themeConfig.appPaddingHorizontalSmall,
                ),
                child: Text(
                  _categories[i]['title'],
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white),
                ),
              ),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Category(
                              title: _categories[i]['title'],
                            )))
              },
            );
          }),
    );
  }

  Widget buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                child: Container(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: buildTitle(_categories[i]['title']),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(_categories[i]['img']),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(
                            title: _categories[i]['title'],
                          )))
            },
          );
        });
  }

  Widget buildTitle(String title) {
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

  Widget buildDrawer() {
    return Drawer(
        child: Container(
            color: Colors.redAccent,
            child: Column(
              children: buildActions(),
            )));
  }

  List<Widget> buildActions() {
    final List<Widget> actions = [];

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 10, 0, 0),
      alignment: Alignment.center,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("img/logo.jpeg"),
            radius: 28,
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
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
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
                .copyWith(color: Colors.white),
          )
        ],
      ),
    ));

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
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
                .copyWith(color: Colors.white),
          )
        ],
      ),
    ));

    actions.add(Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
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
                .copyWith(color: Colors.white),
          )
        ],
      ),
    ));

    return actions;
  }
}
