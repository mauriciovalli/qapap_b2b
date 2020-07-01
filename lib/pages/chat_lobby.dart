import 'package:flutter/material.dart';
import 'package:qapaq_b2b/presentation/chat/favorite_contacts.dart';
import 'package:qapaq_b2b/presentation/chat/recent_chats.dart';

class ChatHomeScreen extends StatefulWidget {
  final isDesktop;
  ChatHomeScreen({this.isDesktop});
  
  @override
  _ChatMobileHomeScreenState createState() => false ? _ChatWebHomeScreenState : _ChatMobileHomeScreenState();
}

class _ChatWebHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class _ChatMobileHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {Navigator.of(context).pop(true);},
        ),
        title: Text(
          'Mensajes',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
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
    );
  }
}