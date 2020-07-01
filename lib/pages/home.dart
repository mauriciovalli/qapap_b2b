import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_list.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_simple_list.dart';
import 'package:qapaq_b2b/presentation/common/widgets/drawer.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header.dart';
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
            //MySwiper(),
            Row(
              children: [
                Container(
                  height: themeConfig.isDesktop && !themeConfig.isSmallDesktop
                      ? 40
                      : 10,
                  width: 280,
                  color: Theme.of(context).accentColor,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                  child: Container(
                      child:
                          themeConfig.isDesktop && !themeConfig.isSmallDesktop
                              ? Row(
                                  children: [
                                    Text(
                                      "Categorias",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 12),
                                    ),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                )
                              : null),
                ),
                Container(
                  height: themeConfig.isDesktop && !themeConfig.isSmallDesktop
                      ? 40
                      : 10,
                  width: MediaQuery.of(context).size.width - 280,
                  color: CompanyColors.red[900],
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width - 280 - 120, 0, 0, 0),
                  child: themeConfig.isDesktop && !themeConfig.isSmallDesktop
                      ? Row(
                          children: [
                            Icon(
                              Icons.language,
                              color: Theme.of(context).primaryColor,
                              size: 30,
                            ),
                            Text(
                              "ESP / ENG",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              ],
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
                    Container(
                      width: 280,
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
