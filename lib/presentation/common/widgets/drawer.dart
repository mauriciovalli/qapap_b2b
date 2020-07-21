import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/pages/chat_lobby.dart';
import 'package:qapaq_b2b/presentation/category/widgets/category_simple_list.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    var actions = getActions(context);
    return Drawer(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
              color: Theme.of(context).primaryColor,
              child: buildActionAvatar(themeConfig)),
        ),
        //SliverToBoxAdapter(child: SizedBox(height: 0)),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => buildActionItem(context, actions[index]),
            childCount: actions.length,
          ),
        ),
        CategorySimpleList(),
      ]),
      // ),
    );
  }

  List<MyAction> getActions(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final List<MyAction> actions = [];
    //actions.add(buildActionAvatar(themeConfig));
    actions.add(new MyAction("Perfil", Icons.assignment_ind, () => null));
    actions.add(new MyAction("Empresa", Icons.assignment, () => null));
    actions.add(new MyAction(
      "Mensajes",
      Icons.message,
      () => themeConfig.isDesktop || themeConfig.isSmallDesktop
          ? Navigator.pushNamed(context, ChatHomeScreen.route)
          : Navigator.push(context,
              new MaterialPageRoute(builder: (context) => ChatHomeScreen())),
    ));
    //actions.add(new MyAction("Ordenes", Icons.content_paste, () => null));
//    actions.add(new MyAction("Carrito", Icons.shopping_cart, () => null));
    return actions;
  }

  Widget buildActionItem(BuildContext context, MyAction action) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                action.icon,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  action.text,
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
        onTap: action.function,
        hoverColor: Theme.of(context).accentColor,
      ),
      //),
    );
  }

  Container buildActionAvatar(ThemeConfig themeConfig) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      alignment: Alignment.center,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage("img/logo.jpeg"),
        radius: 28,
      ),
    );
  }
}

class MyAction<T extends Object> {
  String text;
  IconData icon;
  Function function;

  MyAction(this.text, this.icon, this.function);
}
