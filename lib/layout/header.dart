import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme_config.dart';

class myAppBar {
  static Widget appBar(TextEditingController searchController, ThemeConfig themeConfig,
      BuildContext context) {
    var titleWiget = _TitleWiget(
        textController: searchController, themeConfig: themeConfig);

    return AppBar(
      elevation: 0.1,
      title: titleWiget,
      actions: themeConfig.isDesktop && !themeConfig.isSmallDesktop
          ? titleWiget.buildActions(context)
          : [],
    );
  }
}

class _TitleWiget extends StatelessWidget {
  final TextEditingController textController;
  final ThemeConfig themeConfig;

  const _TitleWiget({Key key, this.textController, this.themeConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: themeConfig.appPaddingVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if(themeConfig.isDesktop && !themeConfig.isSmallDesktop)
              Container(
              padding: EdgeInsets.fromLTRB(
                  0, 0, themeConfig.appPaddingHorizontalLarge, 0),
              child: Image.asset(
                themeConfig.isDesktop && !themeConfig.isSmallDesktop ? 'img/logo_qapaq.png' : 'img/logo_qapaq_small.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            Expanded(
              child: _SearchTextField(textController: textController),
            ),
          ],
        ));
  }

  List<Widget> buildActions(BuildContext context) {

    final List<Widget> actions = [];

    actions.add(Container(
      padding:
      EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalLarge, 0, 0, 0),
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
    ));

    actions.add(Container(
      padding:
      EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalSmall, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Icon(
            Icons.message,
            color: Colors.white,
          ),
          Text(
            "Mensajes",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    ));

    actions.add(Container(
      padding:
      EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalSmall, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Icon(
            Icons.content_paste,
            color: Colors.white,
          ),
          Text(
            "Ordenes",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    ));

    actions.add(Container(
      padding:
      EdgeInsets.fromLTRB(themeConfig.appPaddingHorizontalSmall, 10, 0, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Text(
            "Carrito",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    ));

    return actions;
  }
}

class _SearchTextField extends StatelessWidget {
  final TextEditingController textController;

  _SearchTextField({this.textController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      cursorColor: Theme.of(context).colorScheme.secondary,
      style:
          Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
      onTap: () {},
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        contentPadding: const EdgeInsets.all(16),
        //fillColor: Colors.red,
        filled: true,
        hintText: "Busca productos o empresas ...",
        hintStyle:
            Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(
          Icons.search,
          size: 24,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
