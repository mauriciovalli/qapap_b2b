import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:qapaq_b2b/configuration/theme.dart';
import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/presentation/common/widgets/drawer.dart';
import 'package:qapaq_b2b/presentation/common/widgets/header.dart';
import 'package:qapaq_b2b/presentation/common/widgets/swiper.dart';
import 'package:qapaq_b2b/services/product_repository.dart';

import '../dependencies_provider.dart';

class ProductDetails extends StatefulWidget {
  final String id;

  const ProductDetails({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();

  static const String baseRoute = '/productDetails';

  static String Function(String id) routeFromId =
      (String id) => baseRoute + '/$id';
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final ThemeConfig themeConfig = ThemeConfig.instance(context);
    final ProductRepository _repository = getIt<ProductRepository>();
    Future<ProductModel> _findById = _repository.findById(int.parse(widget.id));

    return Scaffold(
        appBar: MyAppBar(
          height: themeConfig.isDesktop || themeConfig.isSmallDesktop
              ? 80
              : kToolbarHeight,
        ),
        drawer: themeConfig.isDesktop && !themeConfig.isSmallDesktop
            ? null
            : MyDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MySwiper(),
            Expanded(
              flex: 9,
              child: FutureBuilder<ProductModel>(
                  future:
                      _findById, // a previously-obtained Future<String> or null
                  builder: (BuildContext context,
                      AsyncSnapshot<ProductModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: buildCard(snapshot.data),
                            flex: 5,
                          ),
                          Expanded(
                            child: buildDescription(snapshot.data),
                          ),
                        ],
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  }),
            ),
          ],
        ));
  }

  Widget buildCard(ProductModel product) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffdddddd),
        ),
//        width: MediaQuery.of(context).size.width -50,
//        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                child: buildImgCarousel(product.images),
                //padding: EdgeInsets.all(20),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("\$${product.priceMax}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Color(0xff36004f),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Container(
                          child: Text("\$${product.priceMin}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.red)),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Color(0xff36004f),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "\$${product.priceMin}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImgCarousel(List<AnyImage> images) {
    return Swiper(
      outer: false,
      itemBuilder: (context, i) {
        if (images[i].src.length > 0 && images[i].src.startsWith("http"))
          return Image.network(images[i].src, fit: BoxFit.scaleDown);
        else if (images[i].src.length > 0)
          return Image.asset(images[i].src, fit: BoxFit.scaleDown);
        else
          return Image.asset("img/no-image.png", fit: BoxFit.scaleDown);
      },
      autoplay: false,
      itemCount: images.length,
      pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
      control: new SwiperControl(),
    );
  }

  Widget buildDescription(ProductModel product) {
    return ListTile(
      title: SelectableText("${product.name} Details"),
      subtitle: SelectableText("subtitle...."),
    );
  }
}
