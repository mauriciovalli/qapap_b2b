import 'package:qapaq_b2b/models/any_image.dart';

abstract class AnyImageRepository {
  static AnyImage parseImage(Map<String, dynamic> json) {
    return AnyImage(
        id: json['id'],
        title: json['title'],
        src: json['src'],
        alt: json['alt']);
  }
}
