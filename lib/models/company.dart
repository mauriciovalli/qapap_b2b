import 'package:flutter/cupertino.dart';

class CompanyModel {
  int id;
  String name;
  String country;
  Widget countryIcon =  Image.asset('icons/flags/png/de.png', package: 'country_icons');
  int years;

  CompanyModel(
      {this.id = 1,
      this.name = "BPMX",
      this.country = "Argentina",
      this.countryIcon,
      this.years = 10});

  @override
  toString() => "companyId: $id , companyName: $name";
}
