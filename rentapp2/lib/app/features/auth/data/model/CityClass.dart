class CityClass {

  int? idCity;
  int? regionId;
  String? name;

  CityClass({
    this.idCity,
    this.regionId,
    this.name,
  });

  factory CityClass.fromJson(Map<String, dynamic> json) => CityClass(
    idCity: json["idCity"],
    regionId: json["regionId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "idCity": idCity,
    "regionId": regionId,
    "name": name,
  };
}
