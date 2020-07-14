import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/message.dart';
import 'package:qapaq_b2b/presentation/chat/favorite_contacts.dart';
import 'package:qapaq_b2b/presentation/chat/recent_chats.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header.dart';

import 'chat_screen.dart';

class ChatHomeScreen extends StatefulWidget {
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();

  static const String route = '/chat';
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: MyAppBar(
        height: themeConfig.isDesktop || themeConfig.isSmallDesktop
            ? 80
            : kToolbarHeight,
      ),
      body: ThemeConfig.instance(context).isDesktop
          ? Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  color: Colors.white,
                  //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: TextField(
                          style: new TextStyle(color: Colors.grey),
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                new Icon(Icons.search, color: Colors.grey),
                            hintText: "Buscar un contacto...",
                            hintStyle: new TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      RecentChats(),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ChatScreen(
                      user: favorites[0],
                    )),
              ],
            )
          : Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  //CategorySelector(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          FavoriteContacts(),
                          RecentChats(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
