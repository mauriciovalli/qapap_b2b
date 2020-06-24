import 'package:flutter/material.dart';
import 'package:qapaq_b2b/presentation/common/widgets/swiper.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final int id;

  const CategoryPage({Key key, this.title, this.id}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MySwiper(),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: null, //ProductList(widget.id),
            ),
            flex: 4,
          )
        ],
      ),
    );
  }

  Widget buildSingleSubcategory({String imgLocation, String imgCaption}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: Colors.lightBlueAccent,
        onTap: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            children: <Widget>[
              Image.asset(
                imgLocation,
                scale: 3.5,
              ),
              Text(
                imgCaption,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
