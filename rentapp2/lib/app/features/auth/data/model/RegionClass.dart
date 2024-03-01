class RegionClass {

  int? idRegion;
  int? countryId;
  String? name;

  RegionClass({
    this.idRegion,
    this.countryId,
    this.name,
  });

  factory RegionClass.fromJson(Map<String, dynamic> json) => RegionClass(
    idRegion: json["idRegion"],
    countryId: json["countryId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "idRegion": idRegion,
    "countryId": countryId,
    "name": name,
  };
}
