import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
            child: buildSwiper(),
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

  Widget buildSwiper() {
    List<String> imgs = [
      'img/c1.jpg',
      'img/m1.jpeg',
      'img/m2.jpg',
      'img/w1.jpeg',
      'img/w3.jpeg',
      'img/w4.jpeg',
    ];

    return Swiper(
      outer: false,
      itemBuilder: (context, i) {
        return Image.asset(
          imgs[i],
          fit: BoxFit.cover,
        );
      },
      autoplay: true,
      duration: 300,
      pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
      itemCount: imgs.length,
    );
  }

  Widget buildImgCarousel() {
    return Container(
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('img/c1.jpg'),
          AssetImage('img/m1.jpeg'),
          AssetImage('img/m2.jpg'),
          AssetImage('img/w1.jpeg'),
          AssetImage('img/w3.jpeg'),
          AssetImage('img/w4.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 2.0,
        // dotColor: Colors.blue,
      ),
    );
  }
}
