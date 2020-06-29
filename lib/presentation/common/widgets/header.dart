import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header_actions.dart';
import 'package:qapaq_b2b/presentation/common/widgets/searcher.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return AppBar(
      //elevation: 0.1,
      title: _MyTittle(),
      actions: themeConfig.isDesktop && !themeConfig.isSmallDesktop
          ? MyActions().buildActions(context)
          : [],
      iconTheme: new IconThemeData(color: Colors.white),
    );
  }
}

class _MyTittle extends StatelessWidget {
  final TextEditingController textController;

  const _MyTittle({Key key, this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);

    return Container(
        padding: EdgeInsets.symmetric(
          vertical: themeConfig.appPaddingVertical,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.asset(
                themeConfig.isDesktop && !themeConfig.isSmallDesktop
                    ? 'img/logo_qapaq.png'
                    : 'img/logo_qapaq_small.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            Container(
              child: themeConfig.isDesktop ? WebSearcher() : IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    showSearch(context: context, delegate: MobileDataSearcher());
                  }),
            ),
          ],
        ));
  }
}