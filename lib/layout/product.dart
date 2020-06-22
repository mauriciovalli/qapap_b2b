import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qapaq_b2b/layout/single_product.dart';
import 'package:qapaq_b2b/services/product.dart';

class Product extends StatefulWidget {
  final int categoryId;

  const Product({Key key, this.categoryId}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context);
    var _products = productsContainer.listByCategoryId(widget.categoryId);

    return GridView.builder(
        itemCount: _products.length,

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: _products[index].name,
            productPicture: _products[index].image,
            productOldPrice: _products[index].oldPrice,
            productPrice: _products[index].price,
          );
        });
  }
}
