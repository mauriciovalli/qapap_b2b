import 'package:flutter/material.dart';
import 'package:qapaq_b2b/pages/chat.dart';
import 'package:qapaq_b2b/pages/login.dart';

enum AvatarMenu {Perfil , Empresa , Otros}

class MyActions {
  List<Widget> buildActions(BuildContext context) {
    final List<Widget> actions = [];
    actions.add(buildActionAvatar(context));
    actions.add(buildActionItem(context, "Mensajes", Icons.message, ChatPage()));
    //actions.add(buildActionItem(context, "Ordenes", Icons.content_paste, null));
    //actions.add(buildActionItem(context, "Carrito", Icons.shopping_cart, null));
    return actions;
  }

  Widget buildActionAvatar(BuildContext context) {
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

          PopupMenuButton(
            onSelected: (AvatarMenu result) {
              if(result == AvatarMenu.Perfil)
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Login()));
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<AvatarMenu>> [
              PopupMenuItem(value: AvatarMenu.Perfil, child: Text("Perfil")),
              PopupMenuItem(value: AvatarMenu.Empresa, child: Text("Empresa")),
              PopupMenuItem(value: AvatarMenu.Otros, child: Text("Otros")),
            ]),

        ],
      ),
    );
  }

  Widget buildActionItem(BuildContext context,
      String text, IconData icon, Widget navigate) {
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
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => navigate))
    );
  }
}