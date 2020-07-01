import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MySwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: buildSwiper(),
    );
  }

  Widget buildSwiper() {
    final List<String> imgs = [
      'img/cats/food_beverages.jpg',
      'img/cats/agriculture.jpg',
      'img/cats/clothing.jpg',
      'img/cats/house.jpg',
      'img/cats/cars.jpg',
      'img/cats/electronics.jpg',
      'img/cats/toys.jpg',
      'img/cats/crafts.jpg',
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
}
