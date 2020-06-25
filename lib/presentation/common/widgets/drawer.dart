import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_simple_list.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Colors.redAccent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 240,
                  child: Column(children: buildActions(context)),
                ),
                Expanded(child: CategorySimpleList()),
              ],
            )));
  }

  List<Widget> buildActions(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final List<Widget> actions = [];
    actions.add(buildActionAvatar(themeConfig));
    actions.add(buildActionItem(context, "Mensajes", Icons.message));
    actions.add(buildActionItem(context, "Ordenes", Icons.content_paste));
    actions.add(buildActionItem(context, "Carrito", Icons.shopping_cart));
    return actions;
  }

  Widget buildActionItem(BuildContext context, String text, IconData icon) {
    return ListTile(
        title: Container(
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