import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme_config.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_list.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_simple_list.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header.dart';
import 'package:qapaq_b2b/presentation/common/widgets/swiper.dart';
import 'package:qapaq_b2b/presentation/product/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return Scaffold(
      appBar: MyAppBar.appBar(searchController, context),
      drawer: themeConfig.isDesktop && !themeConfig.isSmallDesktop
          ? null
          : buildDrawer(),
      body: MediaQuery.of(context).size.width < 1000
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [MySwiper(), CategoryList(), ProductList()])
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CategorySimpleList(),
                MySwiper(),
                CategoryList(),
                ProductList()
              ],
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
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
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
