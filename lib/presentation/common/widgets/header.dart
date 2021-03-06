import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/pages/home.dart';
import 'package:qapaq_b2b/presentation/category/category_bloc.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header_actions.dart';
import 'package:qapaq_b2b/presentation/common/widgets/searcher.dart';
import 'package:qapaq_b2b/presentation/product/product_bloc.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key key, this.height})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  final double height;

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
      toolbarHeight: widget.height,
      title: _MyTittle(),
      actions: themeConfig.isDesktop && !themeConfig.isSmallDesktop
          ? MyActions().buildActions(context)
          : [],
      iconTheme: new IconThemeData(color: Colors.white),
      automaticallyImplyLeading:
          themeConfig.isDesktop && !themeConfig.isSmallDesktop ? false : true,
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
              child: InkWell(
                  child: Image.asset(
                    themeConfig.isDesktop && !themeConfig.isSmallDesktop
                        ? 'img/logo_qapaq.png'
                        : 'img/logo_qapaq_small.png',
                    fit: BoxFit.contain,
                    height: themeConfig.isDesktop && !themeConfig.isSmallDesktop
                        ? 50
                        : 32,
                  ),
                  onTap: () => {
                        BlocProvider.of<CategoryBloc>(context)
                            .add(CategoryLoadEvent()),
                        BlocProvider.of<ProductBloc>(context)
                            .add(ProductHideEvent()),
                        if (themeConfig.isDesktop || themeConfig.isSmallDesktop)
                          Navigator.pushNamed(context, HomePage.route)
                        else
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()))
                      }),
            ),
            Container(
              child: themeConfig.isDesktop && !themeConfig.isSmallDesktop
                  ? WebSearcher()
                  : IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        showSearch(
                            context: context, delegate: MobileDataSearcher());
                      }),
            ),
          ],
        ));
  }
}
