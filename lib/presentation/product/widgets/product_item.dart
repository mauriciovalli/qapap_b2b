import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qapaq_b2b/configuration/theme_config.dart';
import 'package:qapaq_b2b/pages/category.dart';
import 'package:qapaq_b2b/pages/product_details.dart';
import 'package:qapaq_b2b/presentation/product/product_state.dart';

class ProductItem extends StatelessWidget {
  final ProductItemState _item;

  const ProductItem(this._item);

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
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
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
              flex: 5,
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
                      child: Text(_item.price,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, color: Colors.red)),
                    ),
                    Expanded(
                      child: Text(
                        _item.price,
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
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
