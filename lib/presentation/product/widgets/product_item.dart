import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:qapaq_b2b/models/any_image.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/pages/product_details.dart';

class ProductItem extends StatelessWidget {
  final ProductModel _item;
  ProductItem(this._item);

  // esta es la gran mod de JAVI,... Me mandaron al frente !

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildProduct(context),
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => ProductDetails(
                    //navigate to detailed page with passing data
                    productDetailsName: _item.name,
                    productDetailsPicture: _item.images[0].src,
                    productDetailspriceMax: _item.priceMax,
                    productDetailsNewPrice: _item.priceMin,
                  ))),
    );
  }

  Widget buildProduct(BuildContext context) {
    String price = _item.priceMin.toString();
    String priceMax = _item.priceMax.toString();

    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 220,
                child: buildImgCarousel(_item.images),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: 220,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.grey[200],
                        child: Row(
                          children: [
                            Text(
                              "   ",
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                color: Colors.grey[200],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("  "),
                                    Text(
                                      _item.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text("  "),
                                    Text(
                                      "U\$$price",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      "U\$$priceMax",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w400,
//                                          decoration:
//                                              TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text("  "),
                                    Text("  "),
                                    Text("USS 100 x cada mil unidades"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          color: Colors.grey[400],
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("  "),
                                        Icon(Icons.collections,
                                            size: 20, color: Colors.yellow),
                                        Text("  "),
                                        Text(
                                          "BPMX Co. Limited",
                                          style: TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  "),
                                        Container(
                                            height: 10,
                                            child: Tab(
                                                icon: Image.asset(
                                                    'icons/flags/png/ar.png',
                                                    package: 'country_icons'))),
                                        Text("  "),
                                        Text("Arg. 10 años",
                                            style: TextStyle(fontSize: 12))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_alarm,
                                            size: 20, color: Colors.black),
                                        Text("  "),
                                        Text("84 %",
                                            style: TextStyle(fontSize: 12))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        Text("  "),
                                        Text("4.8",
                                            style: TextStyle(fontSize: 12))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MaterialButton(
                                      padding: EdgeInsets.all(8.0),
                                      textColor: Colors.white,
                                      splashColor: Colors.greenAccent,
                                      elevation: 8.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                          color: Colors.red,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Contactar Vendedor",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      // ),
                                      onPressed: () {
                                        print('Tapped');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //       heightFactor: 0.1,
      ),
    );
  }

  Widget buildImgCarousel(List<AnyImage> images) {
    return Swiper(
      outer: false,
      itemBuilder: (context, i) {
          if(images[i].src.length>0 && images[i].src.startsWith("http"))
            return Image.network(images[i].src, fit: BoxFit.scaleDown);
          else if(images[i].src.length>0)
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
}
