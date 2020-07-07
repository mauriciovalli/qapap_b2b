import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/message.dart';
import 'package:qapaq_b2b/models/user.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing =
      false; // make it true whenever the user is typing in the input field.

  /* Modify _handleSubmitted to update _isComposing to false
  when the text field is cleared.*/
  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });

    final time = DateFormat('kk:mm').format(DateTime.now());
    Message message = new Message(
        sender: this.widget.user,
        time: time,
        text: text,
        isLiked: false,
        unread: true);
    setState(() {
      messages.insert(0, message);
    });
  }

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
          : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: ThemeConfig(context).isDesktop ? MediaQuery.of(context).size.width * 0.45 : MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Color(0xFFFEF9EB) : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              message.text,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: ThemeConfig(context).isDesktop ? 13 : 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Container(
            
            alignment: Alignment.topRight,
            child: Text(
              message.time,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: ThemeConfig(context).isDesktop ? 13 : 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[msg],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: _textController,
              onChanged: (text) {
                setState(() {
                  _isComposing = text.length > 0;
                });
              },
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildChat() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).iconTheme.color,
                borderRadius: BorderRadius.only(
                  topLeft: ThemeConfig(context).isDesktop ? Radius.circular(0.0) : Radius.circular(30.0),
                  topRight: ThemeConfig(context).isDesktop ? Radius.circular(0.0) : Radius.circular(30.0),
                ),
              ),
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(top: 15.0),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                },
              ),
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeConfig(context).isDesktop
        ? _buildChat()
        : Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              iconTheme:
                  IconThemeData(color: Theme.of(context).iconTheme.color),
              title: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () {},
                ),
              ],
            ),
            body: _buildChat(),
          );
  }
}
