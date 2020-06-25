import 'package:flutter/material.dart';

class MyActions {
  List<Widget> buildActions(BuildContext context) {
    final List<Widget> actions = [];
    actions.add(buildActionAvatar());
    actions
        .add(buildActionItem(context, "Mensajes", Icons.message));
    actions.add(
        buildActionItem(context, "Ordenes", Icons.content_paste));
    actions.add(
        buildActionItem(context, "Carrito", Icons.shopping_cart));
    return actions;
  }

  Widget buildActionAvatar() {
    return Container(
      padding:
      EdgeInsets.fromLTRB(20, 0, 0, 0),
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
    );
  }

  Widget buildActionItem(BuildContext context,
      String text, IconData icon) {
    return InkWell(
      child: Container(
        padding:
        EdgeInsets.fromLTRB(20, 10, 0, 0),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 10, color: Colors.white),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}