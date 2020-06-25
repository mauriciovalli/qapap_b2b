import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
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
                "Categorias",
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

  Widget buildDrawer() {
    return Drawer(
        child: Container(
            color: Colors.redAccent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 200,
                  child: Column(children: buildActions()),
                ),
                Expanded(child: CategorySimpleList()),
              ],
            )));
  }

  List<Widget> buildActions() {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final List<Widget> actions = [];
    actions.add(buildActionAvatar(themeConfig));
    actions.add(buildActionItem("Mensajes", Icons.message));
    actions.add(buildActionItem("Ordenes", Icons.content_paste));
    actions.add(buildActionItem("Carrito", Icons.shopping_cart));
    return actions;
  }

  Widget buildActionItem(String text, IconData icon) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
        onTap: () => {
              //BlocProvider.of<CategoryBloc>(context).add(CategoryHide()),
              //BlocProvider.of<ProductBloc>(context).add(ProductLoad(_item.id)),
            });
  }

  Container buildActionAvatar(ThemeConfig themeConfig) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 10, 0, 0),
      alignment: Alignment.center,
      width: 100,
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
    );
  }
}
