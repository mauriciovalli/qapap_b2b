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

  static const String route = '/';
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return Scaffold(
        appBar: MyAppBar(
          height: themeConfig.isDesktop && !themeConfig.isSmallDesktop
              ? 80
              : kToolbarHeight,
        ),
        drawer: themeConfig.isDesktop && !themeConfig.isSmallDesktop
            ? null
            : MyDrawer(),
        backgroundColor: Colors.grey[200],
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //MySwiper(),
            Row(
              children: [
                if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
                  Container(
                    height: 40,
                    width: 280,
                    color: Theme.of(context).accentColor,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "Categorias",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: Colors.white),
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
                      ),
                    ),
                  ),
                if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
                  Container(
                    height: 40,
                    width: 200,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      color: CompanyColors.red[900],
                      border: Border(
                        right: BorderSide(width: 1, color: Colors.grey[800]),
                      ),
                    ),
                    child: Text(
                      "Vender en Qapaq",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.white),
                    ),
                  ),
                if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
                  Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      color: CompanyColors.red[900],
                      border: Border(
                        right: BorderSide(width: 1, color: Colors.grey[800]),
                      ),
                    ),
                    child: Text(
                      "Ayuda",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.white),
                    ),
                  ),
                if (themeConfig.isDesktop && !themeConfig.isSmallDesktop)
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 630,
                      color: CompanyColors.red[900],
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width - 630 - 120,
                          0,
                          0,
                          0),
                      child: Language()),
                if (!(themeConfig.isDesktop && !themeConfig.isSmallDesktop))
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width,
                    color: CompanyColors.red[900],
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
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: SizedBox(height: 10)),
                          CategorySimpleList(),
                        ],
                      ),
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

class Language extends StatefulWidget {
  Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final List<String> filterTypes = <String>['ESPAÑOL', 'ENGLISH'];

  String selectedFilterType;

  void initState() {
    super.initState();
    selectedFilterType = filterTypes[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          DropdownButton<String>(
            value: selectedFilterType,
            onChanged: (String value) {
              setState(() {
                selectedFilterType = value;
              });
            },
            dropdownColor: Colors.grey[300],
            focusColor: Colors.grey[400],
            underline: Container(),
            items: filterTypes.map((String filter) {
              return DropdownMenuItem<String>(
                value: filter,
                child: Container(
                  child: Text(
                    filter,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
