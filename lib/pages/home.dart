import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_list.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_simple_list.dart';
import 'package:qapaq_b2b/presentation/common/widgets/drawer.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header.dart';
import 'package:qapaq_b2b/presentation/common/widgets/swiper.dart';
import 'package:qapaq_b2b/presentation/product/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return Scaffold(
        appBar: MyAppBar(),
        drawer: themeConfig.isDesktop && !themeConfig.isSmallDesktop
            ? null
            : MyDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MySwiper(),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).accentColor,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Text(
                themeConfig.isDesktop && !themeConfig.isSmallDesktop
                    ? "Categorias"
                    : "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
                    Container(
                      width: 270,
                      child: CategorySimpleList(),
                    ),
                  Expanded(
                    flex: 9,
                    child: Column(children: [CategoryList(), ProductList()]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
