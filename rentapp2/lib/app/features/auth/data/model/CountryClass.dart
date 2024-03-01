class CountryClass {

  int? idCountry;
  String? nameCountry;

  CountryClass({
    this.idCountry,
    this.nameCountry,
  });

  factory CountryClass.fromJson(Map<String, dynamic> json) => CountryClass(
    idCountry: json["idCountry"],
    nameCountry: json["nameCountry"],
  );

  Map<String, dynamic> toJson() => {
    "idCountry": idCountry,
    "nameCountry": nameCountry,
  };
}
