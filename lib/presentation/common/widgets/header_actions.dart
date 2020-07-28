import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/pages/chat_lobby.dart';
import 'package:qapaq_b2b/pages/login.dart';
import 'package:qapaq_b2b/pages/googleLogin.dart';
import 'package:qapaq_b2b/pages/sign_in.dart';

enum AvatarMenu { Ingresar, Perfil, Empresa, Otros }

class MyActions {
  List<Widget> buildActions(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final List<Widget> actions = [];
    actions.add(buildActionAvatar(context));
    actions.add(buildActionItem(
      context,
      new MyAction(
        "Mensajes",
        Icons.message,
        () => themeConfig.isDesktop || themeConfig.isSmallDesktop
            ? Navigator.pushNamed(context, ChatHomeScreen.route)
            : Navigator.push(context,
                new MaterialPageRoute(builder: (context) => ChatHomeScreen())),
      ),
    ));
    return actions;
  }

  Widget buildActionAvatar(BuildContext context) {
    return Container(
      //padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: !loged?AssetImage("img/login/login.png"):NetworkImage(imageUrl),
            radius: 20,
          ),
          PopupMenuButton(
              onSelected: (AvatarMenu result) {
                if (result == AvatarMenu.Ingresar)
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => GoogleLoginPage()));
              },
              icon: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<AvatarMenu>>[
                    PopupMenuItem(
                        value: AvatarMenu.Ingresar, child: Text("Ingresar")),
                    PopupMenuItem(
                        value: AvatarMenu.Perfil, child: Text("Perfil")),
                    PopupMenuItem(
                        value: AvatarMenu.Empresa, child: Text("Empresa")),
                    PopupMenuItem(
                        value: AvatarMenu.Otros, child: Text("Otros")),
                  ]),
        ],
      ),
    );
  }

  Widget buildActionItem(BuildContext context, MyAction action) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 25, 40, 0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Icon(
                action.icon,
                color: Colors.white,
              ),
              Text(
                action.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 10, color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        onTap: action.function);
  }
}

class MyAction<T extends Object> {
  String text;
  IconData icon;
  Function function;

  MyAction(this.text, this.icon, this.function);
}
