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
        child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildActionAvatar(themeConfig),
                Expanded(
                  flex: 2,
                  child: Scaffold(
                    backgroundColor: Theme.of(context).primaryColor,
                    body: CustomScrollView(slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 10)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              buildActionItem(context, actions[index]),
                          childCount: actions.length,
                        ),
                      ),
                    ]),
                  ),
                ),
                Expanded(flex: 6, child: CategorySimpleList()),
              ],
            )));
  }

  List<MyAction> getActions(BuildContext context) {
    final List<MyAction> actions = [];
    //actions.add(buildActionAvatar(themeConfig));
    actions.add(new MyAction("Perfil", Icons.assignment_ind, null));
    actions.add(new MyAction("Empresa", Icons.assignment, null));
    actions.add(new MyAction("Mensajes", Icons.message, ChatHomeScreen()));
    //actions.add(buildActionItem(context, "Ordenes", Icons.content_paste));
    //actions.add(buildActionItem(context, "Carrito", Icons.shopping_cart));
    return actions;
  }

  Widget buildActionItem(BuildContext context, MyAction action) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50.0, minHeight: 40.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
          onTap: () => Navigator.push(context,
              new MaterialPageRoute(builder: (context) => action.navigate)),
        ),
      ),
    );
  }

  Container buildActionAvatar(ThemeConfig themeConfig) {
    return Container(
      height: 100,
      padding:
          EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 10, 0, 0),
      alignment: Alignment.center,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage("img/logo.jpeg"),
        radius: 28,
      ),
    );
  }
}

class MyAction {
  String text;
  IconData icon;
  Widget navigate;

  MyAction(this.text, this.icon, this.navigate);
}
