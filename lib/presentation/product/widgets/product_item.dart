import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qapaq_b2b/models/product.dart';
import 'package:qapaq_b2b/pages/product_details.dart';

class ProductItem extends StatelessWidget {
  final ProductModel _item;
  String price;
  String oldPrice;

  ProductItem(this._item) {
    price = _item.price.toString();
    oldPrice = _item.oldPrice.toString();
  }

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
                    productDetailsPicture: _item.image,
                    productDetailsOldPrice: _item.oldPrice,
                    productDetailsNewPrice: _item.price,
                    productDetailsUnits: "100 kilos",
                    productDetailsCompanyIco: "ICO",
                    productDetailsCompName: "Qapaq",
                    productDetailsCountryIco: "CIC",
                    productDetailsCountryName: "Arg",
                    productDetailsAge: "2 years",

                  ))),
    );
  }

  Widget buildProduct(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 145,
                alignment: Alignment.center,
                child: _item.image.contains('http')
                    ? CachedNetworkImage(
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        imageUrl: _item.image,
                        fit: BoxFit.scaleDown,
                      )
                    : Image.asset(
                        _item.image,
                        fit: BoxFit.scaleDown,
                      ),
              ),
            ),
          Expanded(
              flex: 7,
              child: Container(
                height: 200,
                  child: Column(children: [
                    Expanded(flex: 3,
                      child: Container(
                        color: Colors.grey,
                        width: 1000,
                          child: Column (
                            children: [
                            Text("  "),
                            Text(_item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text("  "),
                            Text("U\$$price",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w800,),
                            ),
                            Text("U\$$oldPrice",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough),
                            ),
                            Text("  "),
                            Text("  "),
                            Text("USS 100 x cada mil unidades"),
                        ],),
                      ),
                    ),
                    Expanded(child: Container(
                        color: Colors.blueGrey,
                        child: Row(children: [
                                Expanded(
                                  child: Column(children: [
                                    Row(children: [ Text("  "),
                                      Icon(Icons.collections, size: 20, color: Colors.yellow),
                                      Text("  "),
                                      Text("BPMX Co. Limited", style: TextStyle(fontSize: 12),)],),
                                    Row(children: [ Text("  "),
                                      Icon(Icons.flag, size: 20,color: Colors.blue),
                                      Text("  "),
                                      Text("Arg. 10 años", style: TextStyle(fontSize: 12))],),
                                  ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Row(children: [
                                      Icon(Icons.access_alarm, size: 20, color: Colors.black),
                                      Text("  "),
                                      Text("84 %", style: TextStyle(fontSize: 12))],),
                                    Row(children: [
                                      Icon(Icons.star, size: 20, color: Colors.black,),
                                      Text("  "),
                                      Text("4.8", style: TextStyle(fontSize: 12))],),
                                  ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(mainAxisAlignment: MainAxisAlignment.end,
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
                                            borderRadius: new BorderRadius.circular(5.0),
                                            color: Colors.red,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Contact Vendedor", style: TextStyle(fontSize: 10),),
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
                        ],)),),
                  ],),
              ),
            ),
          ],
        ),
        //       heightFactor: 0.1,
      ),
    );
  }
}
