class CompanyModel {
  int id;
  String name;
  String country;
  String countryIcon;
  int years;

  CompanyModel(
      {this.id = 1,
      this.name = "BPMX",
      this.country = "Argentina",
      this.countryIcon = "ar.png",
      this.years = 10});

  @override
  toString() => "companyId: $id , companyName: $name";
}
