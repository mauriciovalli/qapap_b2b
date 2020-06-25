import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  // esta es la gran mod de JAVI

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
              ))),
    );
  }

  Widget buildProduct(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: FractionallySizedBox(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 150,
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
              flex: 10,
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  _item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("\$$price",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.red)),
                    ),
                    Expanded(
                      child: Text(
                        "\$$oldPrice",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 7,
            )
          ],
        ),
 //       heightFactor: 0.1,
      ),
    );
  }
}